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
    
    let detent: PresentationDetent
    
    var body: some View {
        NavigationStack {
            Group {
                if let result = stationsService.stationsResult, !stationsService.loadingStations {
                    switch result {
                    case .success(let stations):
                        StationsViewList(stations: stations)
                            .transition(.blurReplace)
                    case .failure(let failure):
                        StationsViewError(error: failure, retry: loadStations)
                            .transition(.blurReplace)
                    }
                } else {
                    if detent == .medium || detent == .large {
                        ProgressView()
                            .transition(.blurReplace)
                    }
                }
            }
            .navigationTitle("stations_view_navigation_title")
            .navigationBarTitleDisplayMode(.inline)
            .navigationSubtitle(stationsService.lastUpdateTimeDetails(locale: locale))
        }
        .task(loadStations)
        .animation(.default, value: detent)
        .animation(.default, value: stationsService.loadingStations)
    }
    
    func loadStations() {
        stationsService.loadStations()
    }
}

#Preview {
    StationsView(detent: .large)
        .environment(StationsService.makePreviewService())
}
