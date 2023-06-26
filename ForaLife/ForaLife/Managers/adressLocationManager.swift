//
//  adressLocationManager.swift
//  ForaLife
//
//  Created by Ricardo Ladislao Martinez Cabrera on 20/06/23.
//

import Foundation
import CoreLocation




class AddressLocationManager {

    
    
    func convertAddressToCoordinates(address: String, completion: @escaping ((Double, Double)?) -> Void) {
        let geocoder = CLGeocoder()
        print(address)
        geocoder.geocodeAddressString(address) { (placemarks, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion(nil) // Llamada de finalización con valores nulos
                return
            }

            if let placemark = placemarks?.first {
                if let coordinates = placemark.location?.coordinate {
                    let coordinatesTuple = (coordinates.latitude, coordinates.longitude)
                    completion(coordinatesTuple) // Llamada de finalización con valores de latitud y longitud empaquetados en una tupla
                }
            }
        }
    }
    
}



