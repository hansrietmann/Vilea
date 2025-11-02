//
//  URLSessionNetworkingService.swift
//  Vilea
//
//  Created by Hans Rietmann on 30.10.2025.
//

import Foundation

final class URLSessionNetworkingService: NetworkingService {
    private let session: URLSession
    private let cache: URLCache
    
    init() {
        let session = URLSession.shared
        let memoryCapacity = 20 * 1024 * 1024 // 20 MB
        let diskCapacity = 100 * 1024 * 1024 // 100 MB
        let cache = URLCache(memoryCapacity: memoryCapacity, diskCapacity: diskCapacity)
        session.configuration.urlCache = cache
        self.session = session
        self.cache = cache
    }
    
    func fetchData(for request: URLRequest) async throws -> (Data, HTTPURLResponse) {
        do {
            let (data, response) = try await session.data(for: request)
            let cachedResponse = CachedURLResponse(response: response, data: data)
            cache.storeCachedResponse(cachedResponse, for: request)
            return try makeHTTPResponse(from: data, response)
            
        } catch let error as URLError {
            guard case .notConnectedToInternet = error.code,
                  let cachedResponse = cache.cachedResponse(for: request) else {
                throw error
            }
            return try makeHTTPResponse(from: cachedResponse.data, cachedResponse.response)
            
        } catch {
            throw error
        }
    }
    
    private func makeHTTPResponse(
        from data: Data,
        _ response: URLResponse
    ) throws -> (Data, HTTPURLResponse){
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        return (data, httpResponse)
    }
}
