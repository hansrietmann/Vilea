//
//  URLSessionNetworkingService.swift
//  Vilea
//
//  Created by Hans Rietmann on 30.10.2025.
//

import Foundation

final class URLSessionNetworkingService: NetworkingService {
    private let session = URLSession.shared
    
    func fetchData(for request: URLRequest) async throws -> (Data, HTTPURLResponse) {
        let (data, response) = try await session.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        return (data, httpResponse)
    }
}
