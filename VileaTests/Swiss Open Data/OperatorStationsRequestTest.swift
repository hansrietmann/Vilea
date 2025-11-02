//
//  OperatorStationsRequestTest.swift
//  Vilea
//
//  Created by Hans Rietmann on 31.10.2025.
//


import Testing
import Foundation
import CoreLocation
@testable import Vilea

@MainActor
struct OperatorStationsRequestTest {
    @Test func testStations() async throws {
        let responseJSON = JSONFile.swissOpenDataOperatorStationsResponse
        let networkingService = URLNetworkingServiceMock()
        networkingService.fetchDataResult =
            .successfullNetworkingResponse(responseJSON)
        networkingService.onFetchData = { request in
            let expectedURL = "https://data.geo.admin.ch/ch.bfe.ladestellen-elektromobilitaet/data/ch.bfe.ladestellen-elektromobilitaet.json"
            #expect(request.httpMethod == "GET", "Expected GET for locale")
            #expect(request.url?.absoluteString == expectedURL)
        }
        
        let sut = OperatorStationsRequest(
            networkingService: networkingService
        )
        let operators = try await sut.operators()
        
        let expectedOperators: OperatorStationsResponse = try responseJSON.data.asObject()
        #expect(
            operators.EVSEData.map(\.OperatorID) == expectedOperators.EVSEData.map(\.OperatorID)
        )
        #expect(networkingService.fetchDataCallCount == 1)
    }
}
