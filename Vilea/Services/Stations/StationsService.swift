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
    var lastUpdateTimeDetails: String {
        guard let lastUpdate else { return "" }
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.doesRelativeDateFormatting = true
        formatter.timeStyle = .short
        let stringDate = formatter.string(from: lastUpdate)
        return "Last update: \(stringDate)"
    }
    private(set) var stationsResult: Result<[ChargingStation], Error>?
    private(set) var loadingStations: Bool = false
    
    private let fetchService: ChargingStationsProvider
    private let locationService: LocationServiceProvider
    
    private var lastUpdate: Date?
    @ObservationIgnored private var stationsTask: Task<Void, Never>? {
        didSet { oldValue?.cancel() }
    }
    @ObservationIgnored private var timer: Timer? { didSet { oldValue?.invalidate() } }
    
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
                lastUpdate = Date()
                prepareAutoUpdate()
            } catch let error {
                guard !Task.isCancelled else { return }
                stationsResult = .failure(error)
            }
        }
    }
    
    private func prepareAutoUpdate() {
        timer = Timer.scheduledTimer(withTimeInterval: 2 * 60, repeats: false) { _ in
            Task { @MainActor [weak self] in
                self?.loadStations()
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
