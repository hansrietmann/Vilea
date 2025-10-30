//
//  SwissOpenDataTranformerTest.swift
//  Vilea
//
//  Created by Hans Rietmann on 30.10.2025.
//

import Testing
@testable import Vilea

@MainActor
struct SwissOpenDataTranformerTest {
    @Test func testStationsList() throws {
        let sut = try SwissOpenDataTranformer.stationsList(
            response: JSONFile.swissOpenDataStationsResponse.data.asObject()
        )
        #expect(sut == .expectedStationsFromSwissOpenDataFetchResponse)
    }
}

