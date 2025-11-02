//
//  OpeningTimesType.swift
//  Vilea
//
//  Created by Hans Rietmann on 31.10.2025.
//

import Foundation

struct OpeningTimesType: Decodable {
    /// The starting and end time for pricing product applicability in the specified period
    let Period: SwissOpenDataArray<PeriodType>
    /// Day values to be used in specifying periods on which the product is available. Workdays = Monday – Friday, Weekend = Saturday – Sunday
    let on: PeriodDayType
}
