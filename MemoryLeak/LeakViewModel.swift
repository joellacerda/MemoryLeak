//
//  LeakViewModel.swift
//  MemoryLeak
//
//  Created by Joel Lacerda on 03/09/24.
//

import Foundation

class LeakViewModel: ObservableObject {
    var view: ContentView?
    
    deinit {
        print("LeakViewModel foi desalocado")
    }
}
