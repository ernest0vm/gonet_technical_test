//
//  ThreadsView.swift
//  gonettest
//
//  Created by Ernesto Valdez on 05/07/20.
//  Copyright © 2020 Ernesto Valdez. All rights reserved.
//

import Foundation
import SwiftUI

struct ThreadsView: View {
    
    @State private var outputList = [String]()
    
    private func initThreads(){
        let operationQueue = OperationQueue()
        let operationA = BlockOperation()
        let operationB = BlockOperation()
        let operationC = BlockOperation()
        var operationArray = [BlockOperation]()
        
        //add priorities for each thread operation
        operationA.queuePriority = .low
        operationB.queuePriority = .normal
        operationC.queuePriority = .high

        //add dependency of ending operationB to operationC
        operationC.addDependency(operationB)

        //add execution block for each thread operation
        operationA.addExecutionBlock {
            for a in 0..<1000 {
                self.outputList.append("Hilo A | Prioridad Baja | Valor \(a)")
            }
            debugPrint("done A")
        }

        operationB.addExecutionBlock {
            for b in 0..<1000 {
                self.outputList.append("Hilo B | Prioridad Media | Valor \(b)")
            }
            debugPrint("done B")
        }

        operationC.addExecutionBlock {
            for c in 0..<1000 {
                self.outputList.append("Hilo C | Prioridad Alta | Valor \(c)")
            }
            debugPrint("done C")
        }
        
        operationArray.append(operationA)
        operationArray.append(operationB)
        operationArray.append(operationC)

        //add operations to main operations queue and wait until finished all task
        operationQueue.addOperations(operationArray, waitUntilFinished: true)
        
    }
    
    var body: some View{
        VStack{
            HStack{
                Spacer()
                Button(action: {
                    self.outputList.removeAll()
                }, label: {
                    Text("Limpiar")
                        .font(.system(size: 20))
                }).padding()
                
                Button(action: {
                    self.initThreads()
                }, label: {
                    Text("Iniciar")
                        .font(.system(size: 20))
                }).padding()
            }
            List {
                ForEach(self.outputList, id: \.self){ item in
                    Text(item)
                }
            }.onAppear {
                UITableView.appearance().separatorStyle = .none
            }
        }
    }
}

#if DEBUG
struct ThreadsView_Previews: PreviewProvider {
    static var previews: some View {
        ThreadsView()
    }
}
#endif
