//
//  TableView.swift
//  gonettest
//
//  Created by Ernesto Valdez on 05/07/20.
//  Copyright © 2020 Ernesto Valdez. All rights reserved.
//

import Foundation
import SwiftUI

struct TableView: View {
    
    @State private var apiResultList = [Result]()
    
    var body: some View{
        List {
            ForEach(self.apiResultList, id: \.id) { item in
                NavigationLink(destination: ItemListDetailView(item: item)){
                    ListItem(item: item)
                }
            }
        }.onAppear {
            ApiManager.shared.getRecordsFromApi() { dataReady, apiResponse in
                if (apiResponse != nil) {
                    self.apiResultList = (apiResponse! as APIResponse).results
                }
            }
        }
    }
}
