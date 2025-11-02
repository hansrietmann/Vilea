//
//  LocationServiceMock.swift
//  Vilea
//
//  Created by Hans Rietmann on 31.10.2025.
//


@testable import Vilea
import CoreLocation

final class LocationServiceMock: LocationServiceProvider {
    var currentLocation: CLLocation?
}