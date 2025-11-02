//
//  PowerType.swift
//  Vilea
//
//  Created by Hans Rietmann on 31.10.2025.
//

import Foundation

/// Defined Charging Facility Power Type.
enum PowerType: String, Decodable {
    case AC_1_PHASE
    case AC_3_PHASE
    case DC
}
