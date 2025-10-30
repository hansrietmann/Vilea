//
//  SwissOpenDataServiceTest.swift
//  Vilea
//
//  Created by Hans Rietmann on 30.10.2025.
//


import Testing
import Foundation
@testable import Vilea

struct SwissOpenDataServiceTest {
    let swissOpenDataStationsResponseFile: JSONFile
    let swissOpenDataStationsResponse: SwissOpenDataStationsFetchResponse
    
    @MainActor
    init() {
        let swissOpenDataStationsResponseFile = JSONFile.swissOpenDataStationsResponse
        self.swissOpenDataStationsResponseFile = swissOpenDataStationsResponseFile
        swissOpenDataStationsResponse = try! swissOpenDataStationsResponseFile.data.asObject()
    }
    
    @Test(arguments: Locale.mockedArray())
    func testStations(_ locale: Locale) async throws {
        let networkingService = URLNetworkingServiceMock()
        networkingService.fetchDataResult =
            .successfullNetworkingResponse(swissOpenDataStationsResponseFile)
        networkingService.onFetchData = { request in
            #expect(request.httpMethod == "GET", "Expected GET for locale")
            
            let supportedEndpoints: Set<String> = [
                "https://data.geo.admin.ch/ch.bfe.ladestellen-elektromobilitaet/data/ch.bfe.ladestellen-elektromobilitaet_de.json",
                "https://data.geo.admin.ch/ch.bfe.ladestellen-elektromobilitaet/data/ch.bfe.ladestellen-elektromobilitaet_fr.json",
                "https://data.geo.admin.ch/ch.bfe.ladestellen-elektromobilitaet/data/ch.bfe.ladestellen-elektromobilitaet_it.json",
                "https://data.geo.admin.ch/ch.bfe.ladestellen-elektromobilitaet/data/ch.bfe.ladestellen-elektromobilitaet_en.json"
            ]
            #expect(
                supportedEndpoints.contains(request.url!.absoluteString),
                "Expected the request's url to be a supported one, but got this one instead: \(request.url?.absoluteString ?? "nil")"
            )
        }
        
        let sut = await SwissOpenDataService(networkingService: networkingService)
        let stations = try await sut.stations(for: locale)
        
        let expectedStations = await SwissOpenDataTranformer
            .stationsList(response: swissOpenDataStationsResponse)
        #expect(stations == expectedStations)
        #expect(networkingService.fetchDataCallCount == 1)
    }
}
