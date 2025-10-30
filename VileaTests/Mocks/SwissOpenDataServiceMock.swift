//
//  SwissOpenDataServiceMock.swift
//  Vilea
//
//  Created by Hans Rietmann on 30.10.2025.
//

@testable import Vilea
import Foundation

final class SwissOpenDataServiceMock: StationsFetchService {
    var stationsResult: Result<[StationModel], Error> = .failure(.emptyMockResult)
    
    func stations(for locale: Locale) async throws -> [StationModel] {
        try stationsResult.get()
    }
}
