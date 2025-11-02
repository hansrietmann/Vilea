//
//  EvseDataType.swift
//  Vilea
//
//  Created by Hans Rietmann on 02.11.2025.
//

import Foundation

struct EvseDataType: Decodable {
    /// The provider whose data records are listed below.
    let OperatorID: String
    /// Free text for operator
    let OperatorName: String
    /// EVSE entries
    let EVSEDataRecord: [EvseDataRecordType]
}
