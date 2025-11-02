//
//  SwissOpenDataTranformer.swift
//  Vilea
//
//  Created by Hans Rietmann on 30.10.2025.
//


import CoreLocation

enum SwissOpenDataTranformer {
    static func chargingStations(
        operators: OperatorStationsResponse,
        availabilities: StationAvailabilitiesResponse
    ) -> [ChargingStation] {
        operators.EVSEData.flatMap { stationOperator in
            stationOperator.EVSEDataRecord
                .reduce([String: ChargingStation]()) { result, record in
                    guard let coordinates = record.GeoCoordinates.coordinates else { return result }
                    var result = result
                
                    let stationID = record.ChargingStationId ?? record.EvseID
                    var spots = result[stationID]?.spots ?? []
                    let newSpot = ChargingSpot(
                        id: record.EvseID,
                        availability: .Unknown,
                        power: record.ChargingFacilities.last?.power?.value
                    )
                    spots.append(newSpot)
                
                    result[stationID] = ChargingStation(
                        id: stationID,
                        operatorID: stationOperator.OperatorID,
                        operatorName: stationOperator.OperatorName,
                        coordinates: CLLocationCoordinate2D(
                            latitude: coordinates.latitude,
                            longitude: coordinates.longitude
                        ),
                        spots: spots
                    )
                
                    return result
                }
                .map { $0.value }
        }
    }
}
