//
//  URLNetworkingServiceMock.swift
//  Vilea
//
//  Created by Hans Rietmann on 30.10.2025.
//

@testable import Vilea
import Foundation

final class URLNetworkingServiceMock: NetworkingService {
    var onFetchData: ((_ request: URLRequest) -> Void)? = nil
    var fetchDataResult: Result<(Data, HTTPURLResponse), Error> = .failure(.emptyMockResult)
    private(set) var fetchDataCallCount: Int = 0
    
    func fetchData(for request: URLRequest) async throws -> (Data, HTTPURLResponse) {
        onFetchData?(request)
        fetchDataCallCount += 1
        return try fetchDataResult.get()
    }
}
