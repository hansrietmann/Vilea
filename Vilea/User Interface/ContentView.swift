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
        Map(interactionModes: [.pan, .zoom]) {
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
            if case .success(let stations) = stationsService.stationsResult {
                ForEach(stations) { station in
                    Marker(
                        station.id,
                        systemImage: "powerplug.portrait",
                        coordinate: station.coordinates
                    )
                    .tint(makeColor(for: station))
                }
            }
        }
        .overlay(alignment: .topLeading) {
            VStack(alignment: .leading, spacing: 12) {
                if case let .success(stations) = stationsService.stationsResult,
                   let station = stations.first {
                    VStack(alignment: .leading) {
                        Text("First station coordinates")
                            .font(.headline)
                        Text(
                            "latitude: \(station.coordinates.latitude)\nlongitude\(station.coordinates.longitude)"
                        )
                    }
                }
                if let location = locationService.currentLocation {
                    VStack(alignment: .leading) {
                        Text("User coordinates")
                            .font(.headline)
                        Text(
                            "latitude: \(location.coordinate.latitude)\nlongitude\(location.coordinate.longitude)"
                        )
                    }
                }
            }
            .safeAreaPadding()
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
    
    private func makeColor(for station: ChargingStation) -> Color {
        if station.spots.contains(where: { $0.availability == .Available }) { return .green }
        return .red
    }
}

#Preview {
    ContentView()
}
