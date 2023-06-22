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
    
    func searchNearbyPlaces(location: String, typeOfPlace: String, apiKey: String, completion: @escaping ([Place]) -> Void) {
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
                print(response.result)
                if let json = value as? [String: Any], let results = json["results"] as? [[String: Any]] {
                    
                    places = self.unwrapFoundResults(json: results, typeOfPlace: typeOfPlace)
                    completion(places) // Llama al bloque de finalización con el resultado
                } else {
                    print("No se pudo convertir el archivo JSON a un arreglo de diccionarios")
                    completion([]) // Llama al bloque de finalización con una lista vacía en caso de error
                }
            case .failure(let error):
                // Maneja el error aquí
                print(error)
                completion([]) // Llama al bloque de finalización con una lista vacía en caso de error
            }
        }
    }
    
    func unwrapFoundResults(json: [[String: Any]], typeOfPlace: String) -> [Place] {
        var places: [Place] = []
        var name: String = ""
        var open: Int = -1
        var priceLevel: Int = -1
        var rating: Double = -1.0
        var latitude: Double = 0.0
        var longitude: Double = 0.0
        var image: Image = Image(systemName: "fork.knife.circle")
        
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
            image = Image(systemName: "fork.knife.circle")
        }
        
        var id: Int = 0
        for item in json {
            for (key, value) in item {
                if key == "name"{
                    name = value as! String
                }
                if key == "opening_hours", let  opening_Hours = value as? [String: Any]{
                    open = opening_Hours["open_now"] as? Int ?? -1
                }

                if key == "price_level" {
                    priceLevel = value as! Int
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
            }
            if (name != "" && open==1) {
                places.append(Place(id: id, name: name, open: open, priceLevel: priceLevel, rating: rating, latitude: latitude, longitude: longitude, image: image))
                id += 1
            }
        }
        
        return places
    }
    
}
