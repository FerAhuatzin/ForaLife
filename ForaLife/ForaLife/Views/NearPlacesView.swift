//
//  NearPlacesView.swift
//  ForaLife
//
//  Created by Fernando Ahuatzin Gallardo on 16/06/23.
//

import SwiftUI

struct NearPlacesView: View {
    @State var place: String
    @State var typeOfPlace: String
    @State var fromAddress: Bool
    @State var departingPlace: String = "hogar"
    @State var latitude = 0.0
    @State var longitude = 0.0
    @State var alreadyEntered = false
    @State var addressLocation =  AddressLocation(latitude:  19.05174801886088 , longitude: -98.28527204225016)
    @State var placesArray: [Place] = []
    @ObservedObject var currrentLocation = CurrentLocationManager()
    let nearPlacesManager = NearPlacesManager()
    let searchLocationManager = SearchLocationManager()
    
    
    var body: some View {
        
        NavigationStack{
            VStack {
                Text(place)
                    .font(.title)
                    .bold()
                    .foregroundColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                    .multilineTextAlignment(.center)
                Text("Cerca de tú " + departingPlace)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .onAppear {
                        // Llama al método de búsqueda al aparecer la vista
                        if !alreadyEntered{
                            latitude = searchLocationManager.getSearchLocationLatitude(fromAddress: fromAddress, currentLocation: currrentLocation, addressLocation: addressLocation)
                            longitude = searchLocationManager.getSearchLocationLongitude(fromAddress: fromAddress, currentLocation: currrentLocation, addressLocation: addressLocation)
                            nearPlacesManager.searchNearbyPlaces(sourceLatitude:latitude,sourceLongitude: longitude,typeOfPlace: typeOfPlace, apiKey: "AIzaSyBYAmE0kwIjb3eyVI0dZCcR-vW75tuX1js") { places in
                                placesArray = places
                            }
                            alreadyEntered  = true
                        }
                    }
                Spacer()
                List (placesArray, id: \.id){place in
                    NearPlaceRow(place: place, sourceLatitude: latitude, sourceLongitude: longitude)
                }
                Spacer()
                
                Footer()
            }
        }
        
        
        
    }
}

struct NearPlacesView_Previews: PreviewProvider {
    static var previews: some View {
        NearPlacesView(place: "Restaurantes",typeOfPlace: "Restaurant", fromAddress: true)
    }
}
