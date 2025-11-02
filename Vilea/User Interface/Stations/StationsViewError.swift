//
//  StationsViewError.swift
//  Vilea
//
//  Created by Hans Rietmann on 30.10.2025.
//


import SwiftUI

struct StationsViewError: View {
    enum Constants {
        static let errorViewSpacing: Double = 16
        static let errorViewSafeAreaPadding: Double = 16 * 3
    }
    
    let error: Error
    let retry: () -> Void
    
    var body: some View {
        VStack(spacing: Constants.errorViewSpacing) {
            Text(error.localizedDescription)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
            Button {
                retry()
            } label: {
                Label("Retry", systemImage: "arrow.clockwise")
            }
        }
        .safeAreaPadding(Constants.errorViewSafeAreaPadding)
    }
}

#Preview {
    StationsViewError(error: URLError(.badURL), retry: {})
}