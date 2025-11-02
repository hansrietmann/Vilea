//
//  File.swift
//  Vilea
//
//  Created by Hans Rietmann on 30.10.2025.
//

import Foundation

func observableUpdatesStream<T, U>(on object: T, at keyPath: KeyPath<T, U>) -> AsyncStream<U> {
    AsyncStream {
        await withCheckedContinuation { continuation in
            let _ = withObservationTracking {
                let _ = object[keyPath: keyPath]
            } onChange: {
                continuation.resume(returning: object[keyPath: keyPath])
            }
        }
    }
}
