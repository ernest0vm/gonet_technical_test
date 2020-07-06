//
//  ContentView.swift
//  gonettest
//
//  Created by Ernesto Valdez on 05/07/20.
//  Copyright © 2020 Ernesto Valdez. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectorIndex = 0
    @State private var buttons = ["Table","Threads"]
    
    var body: some View {
        NavigationView{
            VStack {
                VStack {
                    Picker("Buttons", selection: $selectorIndex) {
                        ForEach(0 ..< buttons.count) { index in
                            Text(self.buttons[index]).tag(index)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.all, 16)
                    Divider()
                }
                GeometryReader { _ in
                    VStack {
                        ChildTabView(index: self.selectorIndex)
                    }
                    
                }
            }.navigationBarTitle("Gonet Technical Test", displayMode: .inline)
        }
    }
}

func ChildTabView(index: Int) -> some View {
    switch index {
    case 0:
        return AnyView(TableView())
    case 1:
        return AnyView(ThreadsView())
    default:
        return AnyView(Text("error loading view"))
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
