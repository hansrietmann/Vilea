//
//  OperatorStationsRequest.swift
//  Vilea
//
//  Created by Hans Rietmann on 31.10.2025.
//


import Foundation
import CoreLocation

final class OperatorStationsRequest: OperatorStationsProvider {
    private let baseURL: URL
    private let networkingService: NetworkingService
    
    init(networkingService: NetworkingService) {
        baseURL = SwissOpenDataService.domain
            .appending(path: "ch.bfe.ladestellen-elektromobilitaet")
            .appending(path: "data")
        self.networkingService = networkingService
    }
    
    func operators() async throws -> OperatorStationsResponse {
        let url = baseURL
            .appending(path: "ch.bfe.ladestellen-elektromobilitaet")
            .appendingPathExtension("json")
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (data, response) = try await networkingService.fetchData(for: request)
        guard response.statusCode == 200 else { throw URLError(.badServerResponse) }
        return try JSONDecoder().decode(OperatorStationsResponse.self, from: data)
    }
}
