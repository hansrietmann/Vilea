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
    @Test func testChargingStations() throws {
        let sut = try SwissOpenDataTranformer.chargingStations(
            operators: JSONFile.swissOpenDataOperatorStationsResponse.data.asObject(),
            availabilities: JSONFile.swissOpenDataStationAvailabilitiesResponse.data.asObject()
        )
        #expect(sut.count == 13_033)
    }
}

