//
//  SearchLoctionManager.swift
//  ForaLife
//
//  Created by Fernando Ahuatzin Gallardo on 20/06/23.
//

import Foundation
import Alamofire

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
            print("Longitude:\(addressLocation.longitude)")
            return addressLocation.longitude
        }
        else {
            print("Longitude:\(currentLocation.userLocation.center.longitude)")
            return currentLocation.userLocation.center.longitude
        }
    }
    
    struct GeocodingResponse: Decodable {
        let results: [GeocodingResult]
    }

    struct GeocodingResult: Decodable {
        let placeID: String

        enum CodingKeys: String, CodingKey {
            case placeID = "place_id"
        }
    }

    func convertCoordinatesToPlaceID(latitude: Double, longitude: Double, apiKey: String, completion: @escaping (String?, Error?) -> Void) {
        let urlString = "https://maps.googleapis.com/maps/api/geocode/json?latlng=\(latitude),\(longitude)&key=\(apiKey)"
        
        AF.request(urlString).responseDecodable(of: GeocodingResponse.self) { response in
            switch response.result {
            case .success(let geocodingResponse):
                if let placeID = geocodingResponse.results.first?.placeID {
                    print("Place ID: \(placeID)")
                    completion(placeID, nil)
                }
            case .failure(let error):
                print("Error: \(error)")
                completion(nil, error)
            }
        }
    }

}
