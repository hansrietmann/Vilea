//
//  SwissOpenDataService.swift
//  Vilea
//
//  Created by Hans Rietmann on 30.10.2025.
//


import Foundation
import CoreLocation

final class SwissOpenDataService: ChargingStationsProvider {
    static let domain: URL = {
        guard let domain = URL(string: "https://data.geo.admin.ch") else {
            fatalError("Invalid domain ULR provided for SwissOpenDataAPI")
        }
        return domain
    }()
    private let operatorStationsRequest: OperatorStationsProvider
    private let stationAvailabilitiesRequest: StationAvailabilitiesProvider
    
    init(networkingService: NetworkingService) {
        operatorStationsRequest = OperatorStationsRequest(networkingService: networkingService)
        stationAvailabilitiesRequest = StationAvailabilitiesRequest(
            networkingService: networkingService
        )
    }
    
    func chargingStations(arround location: CLLocation?) async throws -> [ChargingStation] {
        async let operatorStationsTask = operatorStationsRequest.operators()
        async let stationAvailabilitiesTask = stationAvailabilitiesRequest.availabilities()
        let (operators, availabilities) = try await (
            operatorStationsTask,
            stationAvailabilitiesTask
        )
        return SwissOpenDataTranformer
            .chargingStations(operators: operators, availabilities: availabilities)
    }
}
