//
//  NearPlacesManager.swift
//  ForaLife
//
//  Created by Fernando Ahuatzin Gallardo on 20/06/23.
//

import Foundation
import MapKit
import Alamofire
import SwiftUI

class NearPlacesManager: NSObject, ObservableObject{
    
    //Gets nearby places based on coordinates and typeOfPlace
    func searchPlacesNearby(latitude: Double, longitude: Double, typeOfPlace: String) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = typeOfPlace
        
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
        request.region = region
        
        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            guard let response = response else {
                if let error = error {
                    print("Error searching for restaurants: \(error.localizedDescription)")
                }
                return
            }
            
            for item in response.mapItems {
                print("Name: \(item.name ?? "")")
            }
        }
    }
    
    func searchNearbyPlaces(location: String, typeOfPlace: String, apiKey: String) -> [Place] {
        let url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json"
        var places: [Place] = []
        let parameters: [String: Any] = [
            "location": location, // La ubicación en formato de latitud,longitud (ejemplo: "37.7749,-122.4194")
            "radius": "1000", // Radio en metros para la búsqueda de lugares cercanos
            "type": typeOfPlace, // Tipo de lugar a buscar (en este caso, restaurantes)
            "key": apiKey // Tu clave de API de Google Maps
        ]
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            switch response.result {
            case .success(let value):
                // Maneja la respuesta exitosa aquí
                print(value)
                if let json = value as? [[String: Any]] {
                    places = self.unwrapFoundResults(json: json, typeOfPlace: typeOfPlace)
                }
            case .failure(let error):
                // Maneja el error aquí
                print(error)
            }
        }
        return places
    }
    
    func unwrapFoundResults(json: [[String: Any]], typeOfPlace: String) -> [Place] {
        var places: [Place] = []
        var name: String = ""
        var open: Int = -1
        var priceLevel: Int = -1
        var rating: Double = -1.0
        var latitude: Double = 0.0
        var longitude: Double = 0.0
        var image: Image = Image(systemName: "fork.knife")
        
        switch typeOfPlace {
        case "supermarket":
            image = Image(systemName: "cart.circle")
        case "pharmacy":
            image = Image(systemName: "cross.case.circle")
        case "laundry":
            image = Image(systemName: "washer")
        case "taxi_stop":
            image = Image(systemName: "bus.fill")
        default:
            image = Image(systemName: "fork.knife")
        }
        
        for item in json {
            var id: Int = 0
            
            for (key, value) in item {
                if key == "name" {
                    name = value as! String
                }
                if key == "open_now" {
                    open = value as! Int
                }
                if key == "price_level" {
                    priceLevel = value as! Int
                    print(priceLevel)
                }
                if key == "rating" {
                    rating = value as! Double
                }
                if key == "geometry", let geometry = value as? [String: Any] {
                    if let location = geometry["location"] as? [String: Any] {
                        latitude = location["lat"] as? Double ?? 0.0
                        longitude = location["lng"] as? Double ?? 0.0
                    }
                }
                print(name)
            }
            
            places.append(Place(id: id, name: name, open: open, priceLevel: priceLevel, rating: rating, latitude: latitude, longitude: longitude, image: image))
            id += 1
        }
        
        return places
    }
    
}
