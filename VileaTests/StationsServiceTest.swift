//
//  StationsServiceTest.swift
//  VileaTests
//
//  Created by Hans Rietmann on 29.10.2025.
//

import Testing
import Foundation
@testable import Vilea

@MainActor
struct StationsServiceTest {
    @Test func testFetchStations() async throws {
        let zurichStations = [ChargingStation].makeZurichChargingStations()
        let fetchService = SwissOpenDataServiceMock()
        fetchService.chargingStationsResult = .success(zurichStations)
        let locationService = LocationServiceMock()
        locationService.currentLocation = .makeZurichLocation()
        
        let sut = StationsService(fetchService: fetchService, locationService: locationService)
        
        #expect(sut.loadingStations == false)
        #expect(sut.stationsResult == nil)
        
        sut.loadStations()
        await waitForChanges(on: sut, key: \.loadingStations)
        
        #expect(sut.loadingStations == false)
        let stations = try sut.stationsResult?.get()
        let expectedStations = [zurichStations.first!]
        #expect(stations == expectedStations)
    }
    
    private func waitForChanges<T, U>(on parent: T, key keyPath: KeyPath<T, U>) async {
        await withCheckedContinuation { continuation in
            withObservationTracking {
                _ = parent[keyPath: keyPath]
            } onChange: {
                continuation.resume()
            }
        }
    }
}
