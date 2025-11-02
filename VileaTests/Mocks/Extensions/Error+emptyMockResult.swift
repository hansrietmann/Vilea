//
//  Error+emptyMockResult.swift
//  Vilea
//
//  Created by Hans Rietmann on 30.10.2025.
//

import Foundation

extension Error where Self == NSError {
    static var emptyMockResult: NSError { NSError(domain: "fetchDataResult not provided", code: 0) }
}
