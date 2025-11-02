//
//  SwissOpenDataServiceMock.swift
//  Vilea
//
//  Created by Hans Rietmann on 30.10.2025.
//

@testable import Vilea
import Foundation
import CoreLocation

final class SwissOpenDataServiceMock: ChargingStationsProvider {
    var chargingStationsResult: Result<[ChargingStation], Error> = .failure(.emptyMockResult)
    
    func chargingStations(arround location: CLLocation?) async throws -> [ChargingStation] {
        try chargingStationsResult.get()
    }
}
