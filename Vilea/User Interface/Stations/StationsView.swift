//
//  StationsView.swift
//  Vilea
//
//  Created by Hans Rietmann on 29.10.2025.
//

import SwiftUI

struct StationsView: View {
    @Environment(StationsService.self) var stationsService
    @Environment(\.locale) var locale
    
    var body: some View {
        NavigationStack {
            Group {
                if let result = stationsService.stationsResult, !stationsService.loadingStations {
                    switch result {
                    case .success(let stations):
                        StationsViewList(stations: stations)
                    case .failure(let failure):
                        StationsViewError(error: failure, retry: loadStations)
                    }
                } else {
                    ProgressView()
                }
            }
            .navigationTitle("stations_view_navigation_title")
            .navigationBarTitleDisplayMode(.inline)
            .navigationSubtitle(stationsService.lastUpdateTimeDetails(locale: locale))
        }
        .task(loadStations)
    }
    
    func loadStations() {
        stationsService.loadStations()
    }
}

#Preview {
    StationsView()
        .environment(StationsService.makePreviewService())
}
