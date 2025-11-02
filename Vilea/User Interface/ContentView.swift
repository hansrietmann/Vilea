//
//  ContentView.swift
//  Vilea
//
//  Created by Hans Rietmann on 29.10.2025.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State var stationsService: StationsService
    @State var locationService: LocationService
    @State var presentingList = true
    @State var listPresentationDetent: PresentationDetent = .medium
    
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
        Map {
            if let location = locationService.currentLocation {
                Annotation("My position", coordinate: location.coordinate) {
                    Circle()
                        .frame(width: 18, height: 18)
                        .overlay {
                            Circle().stroke(.quinary, lineWidth: 0.5)
                        }
                        .foregroundStyle(.tint)
                        .padding(4)
                        .background(.regularMaterial)
                        .clipShape(Circle())
                        .overlay {
                            Circle().stroke(.secondary, lineWidth: 0.5)
                        }
                        .shadow(radius: 16)
                }
            }
        }
        .mapFeatureSelectionDisabled { _ in true }
        .mapStyle(
            .standard(
                elevation: .realistic,
                emphasis: .muted,
                pointsOfInterest: .excludingAll,
                showsTraffic: false
            )
        )
        .sheet(isPresented:  $presentingList) {
            StationsView()
                .presentationDetents(
                    [.height(80), .medium, .large],
                    selection: $listPresentationDetent
                )
                .presentationBackgroundInteraction(.enabled)
                .interactiveDismissDisabled()
        }
        .environment(stationsService)
        .environment(locationService)
    }
}

#Preview {
    ContentView()
}
