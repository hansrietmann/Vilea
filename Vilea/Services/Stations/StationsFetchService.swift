//
//  StationsFetchService.swift
//  Vilea
//
//  Created by Hans Rietmann on 30.10.2025.
//

import Foundation
import CoreLocation

protocol StationsFetchService {
    func stations(for locale: Locale, at location: CLLocation) async throws -> [StationModel]
}
