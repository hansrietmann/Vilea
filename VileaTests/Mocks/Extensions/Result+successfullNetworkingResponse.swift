//
//  Result+successfullNetworkingResponse.swift
//  Vilea
//
//  Created by Hans Rietmann on 30.10.2025.
//

import Foundation

extension Result where Success == (Data, HTTPURLResponse) {
    /// Creates a successful networking response result using the provided JSON file data
    /// and a dummy 200 OK HTTPURLResponse.
    static func successfullNetworkingResponse(_ jsonFile: JSONFile) -> Self {
        .success(
            (
                jsonFile.data,
                HTTPURLResponse(
                    url: URL(string: "https://example.com")!,
                    statusCode: 200,
                    httpVersion: "HTTP/1.1",
                    headerFields: [
                        "Content-Type": "application/json"
                    ]
                )!
            )
        )
    }
}
