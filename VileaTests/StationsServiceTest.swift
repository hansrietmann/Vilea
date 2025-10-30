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
    @Test(arguments: Locale.mockedArray())
    func testFetchStations(_ locale: Locale) async throws {
        let fetchService = SwissOpenDataServiceMock()
        fetchService.stationsResult = .success(.expectedStationsFromSwissOpenDataFetchResponse)
        let sut = StationsService(fetchService: fetchService)
        
        #expect(sut.loadingStations == false)
        #expect(sut.stationsResult == nil)
        
        sut.stations(for: locale)
        
        await waitForChanges(on: sut, key: \.loadingStations)
        #expect(sut.loadingStations == false)
        #expect(try sut.stationsResult?.get() == .expectedStationsFromSwissOpenDataFetchResponse)
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
