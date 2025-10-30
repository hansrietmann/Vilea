//
//  StationsService.swift
//  Vilea
//
//  Created by Hans Rietmann on 30.10.2025.
//

import Foundation

@MainActor
@Observable
final class StationsService {
    private let fetchService: StationsFetchService
    private(set) var stationsResult: Result<[StationModel], Error>?
    private(set) var loadingStations: Bool = false
    @ObservationIgnored private var stationsTask: Task<Void, Never>? {
        didSet { oldValue?.cancel() }
    }
    
    init(fetchService: StationsFetchService) {
        self.fetchService = fetchService
    }
    
    func stations(for locale: Locale) {
        stationsTask = Task {
            loadingStations = true
            defer { loadingStations = false }
            do {
                stationsResult = try await .success(fetchService.stations(for: locale))
            } catch {
                stationsResult = .failure(error)
            }
        }
    }
}

extension StationsService {
    static func makePreviewService() -> StationsService {
        let networking = URLSessionNetworkingService()
        let fetchService = SwissOpenDataService(networkingService: networking)
        return StationsService(fetchService: fetchService)
    }
}
