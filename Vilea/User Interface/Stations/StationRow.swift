//
//  StationRow.swift
//  Vilea
//
//  Created by Hans Rietmann on 02.11.2025.
//


import SwiftUI

struct StationRow: View {
    let station: ChargingStation
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(station.operatorName)
                .font(.headline)
            Text(makeSubheadline())
                .font(.subheadline)
            Text(makeBody())
            Text("station_row_identifier_\(station.id)")
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
        .accessibilityLabel(makeAccessibilityLabel())
    }
    
    private var availableSpots: Int {
        station.spots.filter { $0.availability != .Occupied }.count
    }
    
    private var maxAvailablePower: Int {
        station.spots
            .filter { $0.availability != .Occupied }
            .compactMap { $0.power }
            .max() ?? 0
    }
    
    private func makeSubheadline() -> LocalizedStringResource {
        guard availableSpots > 1 else {
            return "station_row_available_spots_singular_\(availableSpots)"
        }
        return "station_row_available_spots_plural_\(availableSpots)"
    }
    
    private func makeBody() -> LocalizedStringResource {
        "station_row_max_available_power_\(maxAvailablePower)"
    }
    
    private func makeAccessibilityLabel() -> LocalizedStringResource {
        "station_row_accessibility_label_\(station.operatorName)\(availableSpots)\(maxAvailablePower)\(station.id)"
    }
}

#Preview {
    List {
        StationRow(station: [ChargingStation].makePreviewStations().first!)
    }
}
