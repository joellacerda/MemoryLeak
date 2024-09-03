//
//  ContentView.swift
//  MemoryLeak
//
//  Created by Joel Lacerda on 03/09/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = LeakViewModel()
    
    var body: some View {
        NavigationView {
            NavigationLink(destination: LeakyDetailView(viewModel: viewModel)) {
                Text("Go to Detail View")
            }
        }
        .onAppear {
            viewModel.view = self
        }
        .onDisappear {
            viewModel.view = nil
        }
    }
}

#Preview {
    ContentView()
}
