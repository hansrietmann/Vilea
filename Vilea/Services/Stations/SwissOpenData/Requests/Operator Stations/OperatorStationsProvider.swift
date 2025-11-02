//
//  OperatorStationsProvider.swift
//  Vilea
//
//  Created by Hans Rietmann on 02.11.2025.
//


protocol OperatorStationsProvider {
    func operators() async throws -> OperatorStationsResponse
}
