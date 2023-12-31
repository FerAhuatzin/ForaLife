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
    
    func searchNearbyPlaces(sourceLatitude: Double, sourceLongitude: Double, typeOfPlace: String, apiKey: String, meters: Int, completion: @escaping ([Place]) -> Void) {
        let url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json"
        let parameters: [String: Any] = [
            "location": "\(sourceLatitude),\(sourceLongitude)", // La ubicación en formato de latitud,longitud (ejemplo: "37.7749,-122.4194")
            "radius": String(meters), // Radio en metros para la búsqueda de lugares cercanos
            "type": typeOfPlace, // Tipo de lugar a buscar (en este caso, restaurantes)
            "key": apiKey // Tu clave de API de Google Maps
        ]
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            switch response.result {
            case .success(let value):
                print(response.result)
                if let json = value as? [String: Any], let results = json["results"] as? [[String: Any]] {
                    
                    self.unwrapFoundResults(json: results, typeOfPlace: typeOfPlace, sourceLatitude: sourceLatitude, sourceLongitude: sourceLongitude, apiKey: apiKey) { places in
                        completion(places)
                    }
                    
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
    
    func unwrapFoundResults(json: [[String: Any]], typeOfPlace: String, sourceLatitude: Double, sourceLongitude: Double, apiKey: String, completion: @escaping ([Place]) -> Void) {
        var places: [Place] = []
        var image: Image = Image(systemName: "person.fill")
        switch typeOfPlace {
        case "supermarket":
            image = Image(systemName: "cart.circle")
        case "pharmacy":
            image = Image(systemName: "cross.case.circle")
        case "laundry":
            image = Image(systemName: "washer")
        case "atm":
            image = Image(systemName: "creditcard.circle")
        default:
            image = Image(systemName: "fork.knife.circle")
        }
        
        let group = DispatchGroup()
        var id: Int = 0
        
        for item in json {
            var name: String = ""
            var open: Int = -1
            var priceLevel: Int = 0
            var rating: Double = -1.0
            var latitude: Double = 0.0
            var longitude: Double = 0.0
            var distanceToPlace: Double = 0.0
            var businessStatus: String = ""
            
            for (key, value) in item {
                if key == "name" {
                    name = value as! String
                }
                if key == "opening_hours", let opening_Hours = value as? [String: Any] {
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
                if key == "business_status" {
                    businessStatus = value as! String
                }
            }
            
            if (name != "" && open == 1 && businessStatus == "OPERATIONAL") {
                group.enter()
                calculateDistance(from: "\(sourceLatitude),\(sourceLongitude)", to: "\(latitude),\(longitude)", apiKey: apiKey) { distance in
                    if let distance = distance {
                        distanceToPlace = distance
                        places.append(Place(id: id, name: name, priceLevel: priceLevel, rating: rating, latitude: latitude, longitude: longitude, image: image, distanceToPlace: distanceToPlace))
                        id += 1
                    }
                    group.leave()
                }
            }
        }
        
        group.notify(queue: .main) {
            self.quickSortPlaces(&places, low: 0, high: places.count - 1)
            print(places)
            completion(places)
        }
    }

    
    func calculateDistance(from origin: String, to destination: String, apiKey: String, completion: @escaping (Double?) -> Void) {
        let url = "https://maps.googleapis.com/maps/api/directions/json?origin=\(origin)&destination=\(destination)&mode=walking&key=\(apiKey)"

        AF.request(url, method: .get).responseJSON { response in
            switch response.result {
            case .success(let value):
                if let json = value as? [String: Any], let routes = json["routes"] as? [[String: Any]], let firstRoute = routes.first, let legs = firstRoute["legs"] as? [[String: Any]], let firstLeg = legs.first, let distance = firstLeg["distance"] as? [String: Any], let text = distance["text"] as? String {
                    print(text)
                    let transformedDistance = self.transformStringDistanceToDouble(stringDistance: text)
                    completion(transformedDistance)
                } else {
                    print("No se pudo obtener la distancia caminando")
                    completion(nil)
                }
            case .failure:
                completion(nil)
            }
        }
    }
    
    func transformStringDistanceToDouble (stringDistance: String) -> Double{
        var i: Int = 0
        var prefix: String = ""
        var number: String = ""
        var correctFomatedDistance: String = ""
        for char in stringDistance.reversed() {
            if i==1 {
                prefix.append(char)
                break
            }
            i+=1
        }
        for char in stringDistance {
            if char == " " {
                break
            }
            number.append(char)
            i+=1
        }
        switch prefix {
        case "k":
            number = String((Double(number) ?? 1)*1000)
            for char in number {
                if char == "." {
                    break
                }
                correctFomatedDistance.append(char)
                i+=1
            }
        case " ":
            number = String((Double(number) ?? 1)*1)
            for char in number {
                if char == "." {
                    break
                }
                correctFomatedDistance.append(char)
                i+=1
            }
        default:
            print(prefix)
            print("Transicion no completada")
        }
        let double = Double(correctFomatedDistance) ?? 0.0
       return double
    }
  
    func quickSortPlaces(_ places: inout [Place], low: Int, high: Int) {
        if low < high {
            let pivotIndex = partition(&places, low: low, high: high)
            quickSortPlaces(&places, low: low, high: pivotIndex - 1)
            quickSortPlaces(&places, low: pivotIndex + 1, high: high)
        }
    }

    func partition(_ places: inout [Place], low: Int, high: Int) -> Int {
        let pivot = places[high]
        var i = low - 1
        
        for j in low..<high {
            if places[j].distanceToPlace < pivot.distanceToPlace {
                i += 1
                places.swapAt(i, j)
            }
        }
        
        places.swapAt(i + 1, high)
        return i + 1
    }
    
}
