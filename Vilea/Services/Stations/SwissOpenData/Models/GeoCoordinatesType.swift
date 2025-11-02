//
//  GeoCoordinatesType.swift
//  Vilea
//
//  Created by Hans Rietmann on 31.10.2025.
//

import Foundation
import CoreLocation

struct GeoCoordinatesType: Decodable {
    enum CodingKeys: String, CodingKey {
        case google = "Google"
        case decimalDegree = "DecimalDegree"
        case degreeMinuteSeconds = "DegreeMinuteSeconds"
    }
    
    let coordinates: (longitude: Double, latitude: Double)?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // - MARK: Important: One of the following three options MUST be provided
        // (according to documentation)
        // https://github.com/hubject/oicp/blob/master/OICP-2.3/OICP%202.3%20CPO/03_CPO_Data_Types.asciidoc#geocoordinatestype
        
        // Geocoordinates using Google Structure
        if let googleCoordinates = try container.decodeIfPresent(String.self, forKey: .google)?
            .components(separatedBy: .whitespaces),
           googleCoordinates.count == 2 {
            let latitudeValidRange: ClosedRange<Double> = -90...90
            let longitudeValidRange: ClosedRange<Double> = -180...180
            coordinates = if let latitude = Double(googleCoordinates[0]),
                             latitudeValidRange.contains(latitude),
                             let longitude = Double(googleCoordinates[1]),
                             longitudeValidRange.contains(longitude) {
                (longitude: longitude, latitude: latitude)
            } else {
                nil
            }
            return
        }
        
        // Geocoordinates using DecimalDegree Structure
        if let decimalDegree = try container.decodeIfPresent(
            GeoCoordinatesDecimalDegreeType.self,
            forKey: .decimalDegree
        ) {
            coordinates = (
                longitude: decimalDegree.Longitude.value,
                latitude: decimalDegree.Latitude.value
            )
            return
        }
        
        // Geocoordinates using DegreeMinutesSeconds Structure
        let degreeMinuteSeconds = try container.decode(
            GeoCoordinatesDegreeMinuteSecondsType.self,
            forKey: .degreeMinuteSeconds
        )
        coordinates = (
            longitude: degreeMinuteSeconds.Longitude,
            latitude: degreeMinuteSeconds.Latitude
        )
    }
}
