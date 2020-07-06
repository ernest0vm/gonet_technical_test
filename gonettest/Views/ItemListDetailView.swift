//
//  ItemListDetailView.swift
//  gonettest
//
//  Created by Ernesto Valdez on 05/07/20.
//  Copyright © 2020 Ernesto Valdez. All rights reserved.
//

import Foundation
import SwiftUI

struct ItemListDetailView: View {
    var item: Result
    @Environment(\.imageCache) var cache: ImageCache
    @State var orientation = UIDevice.current.orientation
    
    let orientationChanged = NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
        .makeConnectable()
        .autoconnect()
    
    var body: some View{
        
        Group {
            if orientation.isLandscape {
                //Landscape View
                HStack(alignment: .center) {
                    AsyncImage(
                        url: URL(string: "https://image.tmdb.org/t/p/w185" + item.posterPath)!,
                        cache: self.cache,
                        placeholder: Text("Loading..."),
                        configuration: { $0.resizable() }
                    )
                        .cornerRadius(10)
                        .frame(width: 200, height: 200)
                        .padding(.all, 5)
                    
                    VStack(alignment: .center){
                        Text(item.title)
                            .bold()
                            .padding(.all, 5)
                            .font(.system(size: 32))
                            .fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.center)
                        
                        Text(item.overview)
                            .padding(.all, 5)
                    }
                    .padding(.all, 20)
                }
            } else {
                VStack(alignment: .center){
                    //Portrait View
                    Text(item.title)
                        .bold()
                        .padding(.all, 5)
                        .font(.system(size: 32))
                        .multilineTextAlignment(.center)
                    
                    AsyncImage(
                        url: URL(string: "https://image.tmdb.org/t/p/w185" + item.posterPath)!,
                        cache: self.cache,
                        placeholder: Text("Loading..."),
                        configuration: { $0.resizable() }
                    )
                        .cornerRadius(10)
                        .frame(width: 200, height: 200)
                        .padding(.all, 5)
                    
                    Text(item.overview)
                        .padding(.all, 5)
                }
                .padding(.all, 20)
            }
            
        }.onReceive(orientationChanged) { _ in
            self.orientation = UIDevice.current.orientation
        }
        
    }
}

