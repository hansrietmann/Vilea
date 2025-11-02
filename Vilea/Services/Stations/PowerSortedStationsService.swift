//
//  PowerSortedStationsService.swift
//  Vilea
//
//  Created by Hans Rietmann on 02.11.2025.
//


import CoreLocation

final class PowerSortedStationsService: ChargingStationsProvider {
    private let stationsProvider: ChargingStationsProvider
    
    init(stationsProvider: ChargingStationsProvider) {
        self.stationsProvider = stationsProvider
    }
    
    func chargingStations(arround location: CLLocation?) async throws -> [ChargingStation] {
        let stations = try await stationsProvider
            .chargingStations(arround: location)
            .sorted { station1, station2 in
                maxAvailablePower(for: station1) > maxAvailablePower(for: station2)
            }
        return stations
    }
    
    private func maxAvailablePower(for station: ChargingStation) -> Int {
        station.spots
            .filter { $0.availability != .Occupied }
            .compactMap { $0.power }
            .max() ?? 0
    }
}
