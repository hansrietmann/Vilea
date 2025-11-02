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
    private(set) var stationsResult: Result<[ChargingStation], Error>?
    private(set) var loadingStations: Bool = false
    private let fetchService: ChargingStationsProvider
    private let locationService: LocationServiceProvider
    @ObservationIgnored private var stationsTask: Task<Void, Never>? {
        didSet { oldValue?.cancel() }
    }
    
    init(fetchService: ChargingStationsProvider, locationService: LocationServiceProvider) {
        let radiusFilter = StationsInRadiusService(stationsProvider: fetchService)
        let powerSorter = PowerSortedStationsService(stationsProvider: radiusFilter)
        self.fetchService = powerSorter
        self.locationService = locationService
        observeUpdates(of: locationService)
    }
    
    func loadStations() {
        loadStations(at: locationService.currentLocation)
    }
    
    private func observeUpdates(of locationService: LocationServiceProvider) {
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
        stationsTask = Task {
            loadingStations = true
            defer { loadingStations = false }
            do {
                stationsResult = try await
                    .success(fetchService.chargingStations(arround: location))
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
