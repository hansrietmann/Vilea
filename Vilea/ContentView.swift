//
//  ContentView.swift
//  Vilea
//
//  Created by Hans Rietmann on 29.10.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Text("Tab 1")
                .tabItem {
                    Label("Tab 1", systemImage: "1.circle")
                }
            StationsView()
                .tabItem {
                    Label("Stations list", systemImage: "2.circle")
                }
        }
    }
}

#Preview {
    ContentView()
}
