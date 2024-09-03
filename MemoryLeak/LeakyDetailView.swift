//
//  LeakyDetailView.swift
//  MemoryLeak
//
//  Created by Joel Lacerda on 03/09/24.
//

import SwiftUI

struct LeakyDetailView: View {
    @ObservedObject var viewModel: LeakViewModel
    
    var body: some View {
        Text("Detail View")
            .onDisappear {
                print("DetailView desapareceu")
            }
    }
}

#Preview {
    LeakyDetailView(viewModel: LeakViewModel())
}
