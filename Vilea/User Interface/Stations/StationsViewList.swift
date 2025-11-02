//
//  StationsViewList.swift
//  Vilea
//
//  Created by Hans Rietmann on 30.10.2025.
//

import SwiftUI

struct StationsViewList: View {
    let stations: [ChargingStation]
    
    var body: some View {
        List {
            ForEach(stations) { station in
                StationRow(station: station)
            }
        }
    }
}

#Preview {
    StationsViewList(stations: .makePreviewStations())
}
