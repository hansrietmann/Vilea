//
//  StationRow.swift
//  Vilea
//
//  Created by Hans Rietmann on 02.11.2025.
//


import SwiftUI

struct StationRow: View {
    let station: ChargingStation
    var availableSpots: Int {
        station.spots.filter { $0.availability != .Occupied }.count
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(station.operatorName)
                .font(.headline)
            Text("\(availableSpots) spot\(availableSpots > 1 ? "(s)": "") available")
                .font(.subheadline)
            Text(
                "Max. power: \(station.spots.filter { $0.availability != .Occupied }.compactMap { $0.power }.max() ?? 0) kW"
            )
            Text("Identifier: \(station.id)")
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    List {
        StationRow(station: [ChargingStation].makePreviewStations().first!)
    }
}
