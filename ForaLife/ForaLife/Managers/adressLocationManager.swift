//
//  adressLocationManager.swift
//  ForaLife
//
//  Created by Ricardo Ladislao Martinez Cabrera on 20/06/23.
//

import Foundation
import CoreLocation




class AddressLocationManager {

    
    
    func convertAddressToCoordinates(address: String) {
        let geocoder = CLGeocoder()
        print (address)
        geocoder.geocodeAddressString(address) { (placemarks, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            if let placemark = placemarks?.first {
                if let coordinates = placemark.location?.coordinate {
                    print("Latitud: \(coordinates.latitude), Longitud: \(coordinates.longitude)")
                }
            }
        }
    }
}



