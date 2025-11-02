//
//  ContentView.swift
//  Vilea
//
//  Created by Hans Rietmann on 29.10.2025.
//

import SwiftUI

struct ContentView: View {
    @State var stationsService: StationsService
    @State var locationService: LocationService
    
    init() {
        let networking = URLSessionNetworkingService()
        let fetchService = SwissOpenDataService(networkingService: networking)
        let locationService = LocationService()
        self.stationsService = StationsService(
            fetchService: fetchService,
            locationService: locationService
        )
        self.locationService = locationService
    }
    
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
        .environment(stationsService)
        .environment(locationService)
    }
}

#Preview {
    ContentView()
}
