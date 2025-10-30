//
//  StationsInRadiusService.swift
//  Vilea
//
//  Created by Hans Rietmann on 30.10.2025.
//

import Foundation
import CoreLocation

final class StationsInRadiusService: StationsFetchService {
    private let stationsProvider: StationsFetchService
    
    init(stationsProvider: StationsFetchService) {
        self.stationsProvider = stationsProvider
    }
    
    func stations(for locale: Locale, at location: CLLocation) async throws -> [StationModel] {
        let region = CLCircularRegion(
            center: location.coordinate,
            radius: 1_000,
            identifier: UUID().uuidString
        )
        return try await stationsProvider
            .stations(for: locale, at: location)
            .filter { region.contains($0.coordinate) }
    }
}
