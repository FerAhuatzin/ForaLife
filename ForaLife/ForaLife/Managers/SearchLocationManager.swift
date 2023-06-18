//
//  SearchLocationManager.swift
//  ForaLife
//
//  Created by Fernando Ahuatzin Gallardo on 17/06/23.
//

import Foundation

class SearchLocationManager {
    
    func getSearchLocationLatitude (fromAddress: Bool, currentLocation: CurrentLocationManager, addressLocation: AddressLocation) -> Double{
        if fromAddress {
            print("Latitude:\(addressLocation.latitude)")
            return addressLocation.latitude
        }
        else {
            print("Latitude:\(currentLocation.userLocation.center.latitude)")
            return currentLocation.userLocation.center.latitude
        }
    }
    func getSearchLocationLongitude (fromAddress: Bool, currentLocation: CurrentLocationManager, addressLocation: AddressLocation) -> Double{
        if fromAddress {
            print("Latitude:\(addressLocation.longitude)")
            return addressLocation.longitude
        }
        else {
            print("Longitude:\(currentLocation.userLocation.center.longitude)")
            return currentLocation.userLocation.center.longitude
        }
    }

}
