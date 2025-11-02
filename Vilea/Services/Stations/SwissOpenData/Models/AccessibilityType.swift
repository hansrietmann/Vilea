//
//  AccessibilityType.swift
//  Vilea
//
//  Created by Hans Rietmann on 31.10.2025.
//

import Foundation

enum AccessibilityType: String, Decodable {
    /// EV Driver can reach the charging point without paying a fee, e.g. street, free public place, free parking lot, etc.
    case Free_publicly_accessible = "Free publicly accessible"
    /// EV Driver needs permission to reach the charging point, e.g. Campus, building complex, etc.
    case Restricted_access = "Restricted access"
    /// EV Driver needs to pay a fee in order to reach the charging point, e.g. payable parking garage, etc.
    case Paying_publicly_accessible = "Paying publicly accessible"
    /// Station is just for testing purposes. Access may be restricted.
    case Test_Station = "Test Station"
    case Unspecified
}
