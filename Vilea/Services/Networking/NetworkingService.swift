//
//  NetworkingService.swift
//  Vilea
//
//  Created by Hans Rietmann on 30.10.2025.
//


import Foundation

protocol NetworkingService {
    func fetchData(for request: URLRequest) async throws -> (Data, HTTPURLResponse)
}