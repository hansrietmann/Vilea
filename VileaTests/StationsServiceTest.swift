//
//  StationsServiceTest.swift
//  VileaTests
//
//  Created by Hans Rietmann on 29.10.2025.
//

import Testing
import Foundation
@testable import Vilea

struct StationsServiceTest {
    @Test(arguments: Locale.mockedArray())
    func testFetchStations(_ locale: Locale) async throws {
        let fetchService = SwissOpenDataServiceMock()
        fetchService.stationsResult = .success(.expectedStationsFromSwissOpenDataFetchResponse)
        let sut = await StationsService(fetchService: fetchService)
        let fetchedStations = try await sut.stations(for: locale)
        #expect(!fetchedStations.isEmpty)
    }
}
