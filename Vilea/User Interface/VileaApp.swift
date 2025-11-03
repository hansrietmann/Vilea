//
//  VileaApp.swift
//  Vilea
//
//  Created by Hans Rietmann on 29.10.2025.
//

import SwiftUI

@main
struct VileaApp: App {
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
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(stationsService)
                .environment(locationService)
        }
    }
}
