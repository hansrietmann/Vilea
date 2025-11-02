//
//  StationAvailabilitiesProvider.swift
//  Vilea
//
//  Created by Hans Rietmann on 02.11.2025.
//


protocol StationAvailabilitiesProvider {
    func availabilities() async throws -> StationAvailabilitiesResponse
}
