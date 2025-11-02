//
//  ChargingModeType.swift
//  Vilea
//
//  Created by Hans Rietmann on 31.10.2025.
//

import Foundation

enum ChargingModeType: String, Decodable {
    /// conductive connection between a standard socket-outlet of an AC supply network and electric vehicle without communication or additional safety features (IEC 61851-1)
    case Mode_1
    /// conductive connection between a standard socket-outlet of an AC supply network and electric vehicle with communication and additional safety features (IEC 61851-1)
    case Mode_2
    /// conductive connection of an EV to an AC EV supply equipment permanently connected to an AC supply network with communication and additional safety features (IEC 61851-1)
    case Mode_3
    /// conductive connection of an EV to an AC or DC supply network utilizing a DC EV supply equipment, with (high-level) communication and additional safety features (IEC 61851-1)
    case Mode_4
    /// CHAdeMo Specification
    case CHAdeMO
}
