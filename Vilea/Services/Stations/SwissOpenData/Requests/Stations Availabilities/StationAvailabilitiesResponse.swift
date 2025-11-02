//
//  StationAvailabilitiesResponse.swift
//  Vilea
//
//  Created by Hans Rietmann on 02.11.2025.
//


import Foundation

struct StationAvailabilitiesResponse: Decodable {
    let EVSEStatuses: [EVSEStatus]
}