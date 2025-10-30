//
//  StationsFetchService.swift
//  Vilea
//
//  Created by Hans Rietmann on 30.10.2025.
//

import Foundation

protocol StationsFetchService {
    func stations(for locale: Locale) async throws -> [StationModel]
}
