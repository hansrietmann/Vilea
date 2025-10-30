//
//  SwissOpenDataStationsFetchResponse.swift
//  Vilea
//
//  Created by Hans Rietmann on 30.10.2025.
//


struct SwissOpenDataStationsFetchResponse: Decodable {
    let name: String
    struct Feature: Decodable {
        let id: String
        
        struct Geometry: Decodable {
            let coordinates: [Double]
        }
        let geometry: Geometry
        
        struct Properties: Decodable {
            enum Availability: String, Decodable {
                case Available
                case OutOfService
                case Occupied
                case Unknown
            }
            let Availability: Availability
        }
        let properties: Properties
    }
    let features: [Feature]
}
