//
//  EVSEStatusItem.swift
//  Vilea
//
//  Created by Hans Rietmann on 02.11.2025.
//


import Foundation

struct EVSEStatusItem: Decodable {
    let EvseID: String
    let EVSEStatus: EvseStatusType
}