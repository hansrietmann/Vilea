//
//  CalibrationLawDataAvailabilityType.swift
//  Vilea
//
//  Created by Hans Rietmann on 31.10.2025.
//

import Foundation

enum CalibrationLawDataAvailabilityType: String, Decodable {
    /// Calibration law data is shown at the charging station.
    case Local
    /// Calibration law data is provided externaly
    case External
    /// Calibration law data is not provided.
    case NotAvailable = "Not Available"
}
