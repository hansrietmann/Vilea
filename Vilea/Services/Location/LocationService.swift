//
//  LocationService.swift
//  Vilea
//
//  Created by Hans Rietmann on 30.10.2025.
//

import CoreLocation

@MainActor
@Observable
final class LocationService: LocationServiceProvider {
    private(set) var currentLocation: CLLocation?
    @ObservationIgnored private var currentRegion: CLCircularRegion?
    
    init() {
        observeLocationUpdates()
    }
    
    private func observeLocationUpdates() {
        Task {
            // Obtain an asynchronous stream of updates.
            let stream = CLLocationUpdate.liveUpdates()
            
            do {
                // Iterate over the stream and handle incoming updates.
                for try await update in stream {
                    if let location = update.location {
                        // Unsure to update location only when the user moves
                        guard currentRegion?.contains(location.coordinate) != true else { continue }
                        currentLocation = location
                        currentRegion = CLCircularRegion(
                            center: location.coordinate,
                            radius: 50,
                            identifier: UUID().uuidString
                        )
                    }
                }
            } catch {
                fatalError(error.localizedDescription)
            }
        }
    }
}
