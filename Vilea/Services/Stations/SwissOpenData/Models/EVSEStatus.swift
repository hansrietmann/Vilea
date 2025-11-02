//
//  EVSEStatus.swift
//  Vilea
//
//  Created by Hans Rietmann on 02.11.2025.
//


import Foundation

struct EVSEStatus: Decodable {
    let EVSEStatusRecord: [EVSEStatusItem]
    let OperatorID: String
    let OperatorName: String
}