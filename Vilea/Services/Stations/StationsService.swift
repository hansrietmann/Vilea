//
//  StationsService.swift
//  Vilea
//
//  Created by Hans Rietmann on 30.10.2025.
//

import Foundation

final class StationsService {
    private let fetchService: StationsFetchService
    
    init(fetchService: StationsFetchService) {
        self.fetchService = fetchService
    }
    
    func stations(for locale: Locale) async throws -> [StationModel] {
        try await fetchService.stations(for: locale)
    }
}
