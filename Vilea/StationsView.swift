//
//  StationsView.swift
//  Vilea
//
//  Created by Hans Rietmann on 29.10.2025.
//

import SwiftUI

struct StationsView: View {
    var body: some View {
        NavigationStack {
            List {
                Text("Charging Station 1")
            }
            .navigationTitle("Charging stations")
        }
        .tabItem {
            Label("Tab 2", systemImage: "2.circle")
        }
    }
}

#Preview {
    StationsView()
}
