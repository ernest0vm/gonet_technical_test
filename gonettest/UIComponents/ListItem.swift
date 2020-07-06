//
//  ListItem.swift
//  gonettest
//
//  Created by Ernesto Valdez on 05/07/20.
//  Copyright © 2020 Ernesto Valdez. All rights reserved.
//

import Foundation
import SwiftUI

struct ListItem: View{
    var item: Result
    @Environment(\.imageCache) var cache: ImageCache
    
    var body: some View{
        HStack(alignment: .center){
            AsyncImage(
                url: URL(string: "https://image.tmdb.org/t/p/w185" + item.posterPath)!,
                cache: self.cache,
                placeholder: Text("Loading..."),
                configuration: { $0.resizable() }
            )
                .cornerRadius(10)
                .frame(width: 60, height: 60)
                .padding(.all, 5)
            VStack(alignment: .leading){
                Text(item.title)
                    .bold()
                    .lineLimit(1)
                    .padding(.all, 5)
                Text(item.overview)
                    .padding(.all, 5)
            }
        }
    }
}
