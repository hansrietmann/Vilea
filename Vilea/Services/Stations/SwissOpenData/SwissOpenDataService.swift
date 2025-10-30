//
//  SwissOpenDataService.swift
//  Vilea
//
//  Created by Hans Rietmann on 30.10.2025.
//


import Foundation

final class SwissOpenDataService: StationsFetchService {
    private let domain: URL
    private let networkingService: NetworkingService
    
    init(networkingService: NetworkingService) {
        guard let domain = URL(string: "https://data.geo.admin.ch") else {
            fatalError("Invalid domain ULR provided for SwissOpenDataAPI")
        }
        self.domain = domain
        self.networkingService = networkingService
    }
    
    func stations(for locale: Locale) async throws -> [StationModel] {
        let defaultLanguage: String = "en"
        let supportedLanguages: Set<String> = ["de", "fr", "it", defaultLanguage]
        let usersLanguage = locale.language.languageCode?.identifier ?? defaultLanguage
        let preferedLanguage = if supportedLanguages.contains(usersLanguage) {
            usersLanguage
        } else {
            defaultLanguage
        }
        
        let url = domain
            .appending(path: "ch.bfe.ladestellen-elektromobilitaet")
            .appending(path: "data")
            .appending(path: "ch.bfe.ladestellen-elektromobilitaet_\(preferedLanguage).json")
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (data, response) = try await networkingService.fetchData(for: request)
        guard response.statusCode == 200 else { throw URLError(.badServerResponse) }
        return try SwissOpenDataTranformer.stationsList(
            response: JSONDecoder().decode(
                SwissOpenDataStationsFetchResponse.self,
                from: data
            )
        )
    }
}