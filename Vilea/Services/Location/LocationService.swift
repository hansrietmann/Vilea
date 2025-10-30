//
//  LocationService.swift
//  Vilea
//
//  Created by Hans Rietmann on 30.10.2025.
//

import CoreLocation

@MainActor
@Observable
final class LocationService {
    private(set) var currentLocation: CLLocation?
    
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
                        currentLocation = location
                    }
                }
            } catch {
                fatalError(error.localizedDescription)
            }
        }
    }
}
