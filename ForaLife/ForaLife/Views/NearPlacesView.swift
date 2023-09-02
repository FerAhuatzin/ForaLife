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
    @State var addressLocation: AddressLocation
    @State var departingPlace: String = "hogar"
    @State var latitude = 0.0
    @State var longitude = 0.0
    @State var alreadyEntered = false
    @State var placesArray: [Place] = []
    @State var arrive = [true,false]
    @ObservedObject var currentLocationManager = CurrentLocationManager()
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
                    .onAppear() {
                        if !fromAddress {
                            departingPlace = "ubicación"
                        }
                    }
                Text("Cerca de tú " + departingPlace)
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .onAppear {
                        // Llama al método de búsqueda al aparecer la vista
                        if !alreadyEntered {
            
                                searchLocationManager.getSearchLocationLatitude(fromAddress: fromAddress, currentLocation: currentLocationManager, addressLocation: addressLocation) { lat in
                                    self.latitude = lat
                                }
                                
                                searchLocationManager.getSearchLocationLongitude(fromAddress: fromAddress, currentLocation: currentLocationManager, addressLocation: addressLocation) { lon in
                                    self.longitude = lon
                                }
                            print("Latitude: \(latitude)")
                            print("Longitude: \(longitude)")
                            nearPlacesManager.searchNearbyPlaces(sourceLatitude: latitude, sourceLongitude: longitude, typeOfPlace: typeOfPlace, apiKey: "AIzaSyBYAmE0kwIjb3eyVI0dZCcR-vW75tuX1js") { places in
                                    
                                    self.placesArray = places
                                }
                                
                                alreadyEntered = true
                            }
                        }
                Spacer()
                List (placesArray, id: \.id){place in
                    NearPlaceRow(place: place, sourceLatitude: latitude, sourceLongitude: longitude, transportations: $arrive)
                }
                
                Text("¿Cómo planeas llegar?")
                    .padding()
                    .font(.title)
                HStack {
                    Toggle(isOn: $arrive[0]) {
                        HStack {
                            Image(systemName: "figure.walk.circle")
                                .resizable()
                                .frame(width: 30, height:30)
                                .padding()
                          
                        }
                    }
                    .padding()
                    .onChange(of: arrive[0]) { newValue in
                        arrive[1] = !arrive[0]
                    }
                    
                    Toggle(isOn: $arrive[1]) {
                        HStack {
                            Image(systemName: "car.circle")
                                .resizable()
                                .frame(width: 30, height:30)
                                .padding()
                         
                        }
                    }
                    .onChange(of: arrive[1]) { newValue in
                        arrive[0] = !arrive[1]          
                    }
                    
                    Spacer()
                

                }
                Spacer()
                
                Footer()
            }
        }
        
        
        
    }
}

struct NearPlacesView_Previews: PreviewProvider {
    static var previews: some View {
        NearPlacesView(place: "Restaurantes",typeOfPlace: "Restaurant", fromAddress: true, addressLocation: AddressLocation(latitude: 2.0, longitude: 2.0))
    }
}
