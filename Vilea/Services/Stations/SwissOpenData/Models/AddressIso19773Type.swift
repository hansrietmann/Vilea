//
//  AddressIso19773Type.swift
//  Vilea
//
//  Created by Hans Rietmann on 31.10.2025.
//

import Foundation

struct AddressIso19773Type: Decodable {
    let Country: String
    let City: String
    let Street: String
    let PostalCode: String?
    let HouseNum: String?
    let Floor: String?
    let Region: String?
    let ParkingFacility: Bool?
    let ParkingSpot: String?
    let TimeZone: String?
}
