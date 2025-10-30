//
//  StationsService.swift
//  Vilea
//
//  Created by Hans Rietmann on 30.10.2025.
//

import Foundation
import CoreLocation

@MainActor
@Observable
final class StationsService {
    private(set) var stationsResult: Result<[StationModel], Error>?
    private(set) var loadingStations: Bool = false
    private let fetchService: StationsFetchService
    private var locale: Locale?
    @ObservationIgnored private var stationsTask: Task<Void, Never>? {
        didSet { oldValue?.cancel() }
    }
    @ObservationIgnored private weak var locationService: LocationService?
    
    init(fetchService: StationsFetchService, locationService: LocationService) {
        self.fetchService = StationsInRadiusService(stationsProvider: fetchService)
        self.locationService = locationService
        observeUpdates(of: locationService)
    }
    
    func stations(for locale: Locale) {
        self.locale = locale
        loadStations(at: locationService?.currentLocation)
    }
    
    private func observeUpdates(of locationService: LocationService) {
        Task {
            for await location in observableUpdatesStream(
                on: locationService,
                at: \.currentLocation
            ) {
                loadStations(at: location)
            }
        }
    }
    
    private func loadStations(at location: CLLocation?) {
        guard let locale, let location else { return }
        stationsTask = Task {
            loadingStations = true
            defer { loadingStations = false }
            do {
                stationsResult = try await
                    .success(fetchService.stations(for: locale, at: location))
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
        let locationService = LocationService()
        return StationsService(fetchService: fetchService, locationService: locationService)
    }
}
