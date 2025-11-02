//
//  LocationServiceProvider.swift
//  Vilea
//
//  Created by Hans Rietmann on 31.10.2025.
//


import CoreLocation

protocol LocationServiceProvider {
    var currentLocation: CLLocation? { get }
}
