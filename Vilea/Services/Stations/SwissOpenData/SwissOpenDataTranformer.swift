//
//  SwissOpenDataTranformer.swift
//  Vilea
//
//  Created by Hans Rietmann on 30.10.2025.
//


import CoreLocation

enum SwissOpenDataTranformer {
    static func stationsList(
        response stationsFetchResponse: SwissOpenDataStationsFetchResponse
    ) -> [StationModel] {
        stationsFetchResponse.features.compactMap { feature in
            let coordinates = feature.geometry.coordinates
            guard coordinates.count == 2 else { return nil }
            return StationModel(
                id: feature.id,
                coordinate: CLLocationCoordinate2D(
                    latitude: coordinates[0],
                    longitude: coordinates[1]
                )
            )
        }
    }
}