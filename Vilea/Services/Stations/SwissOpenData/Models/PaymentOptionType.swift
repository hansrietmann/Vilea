//
//  PaymentOptionType.swift
//  Vilea
//
//  Created by Hans Rietmann on 31.10.2025.
//

import Foundation

enum PaymentOptionType: String, Decodable {
    /// Free.
    case NoPayment = "No Payment"
    /// e. g. Cash, Card, SMS, …
    case Direct
    /// i. e. Subscription.
    case Contract
}
