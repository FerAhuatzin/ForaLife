//
//  NearPlacesView.swift
//  ForaLife
//
//  Created by Fernando Ahuatzin Gallardo on 16/06/23.
//

import SwiftUI

//crear un arreglo similar llamando a una clase que te permita hacer busquedas conn¡ base a la ubicación o a la dirección del usuario, una vez que hace esas búsquedas los mete en un arreglo con los datos que necesita Place
/*private let places = [
    Place(id:0,name:"MrTaco",image: Image(systemName: "fork.knife.circle"), openingHour: "3:00", closingHour: "12:00", averagePrice: "150",address: "Atzala"),
    Place(id:1,name:"Las kekas",image: Image(systemName: "fork.knife.circle"), openingHour: "3:00", closingHour: "12:00", averagePrice: "80",address: "La Meza"),
    Place(id:2,name:"La terraza",image: Image(systemName: "fork.knife.circle"), openingHour: "3:00", closingHour: "12:00", averagePrice: "110",address: "14 oriente"),
    Place(id:3,name:"Las berenjena",image: Image(systemName: "fork.knife.circle"), openingHour: "3:00", closingHour: "12:00", averagePrice: "180",address: "8 norte")
]*/

struct NearPlacesView: View {
    @State var place: String
    @State var typeOfPlace: String
    @State var fromAddress: Bool
    @State var departingPlace: String = "hogar"
    @State var latitude = 0.0
    @State var longitude = 0.0
    @State var addressLocation =  AddressLocation(latitude:  19.05174801886088 , longitude: -98.28527204225016)
    @State var places: [Place] = []
    @StateObject var currrentLocation = CurrentLocationManager()
    let nearPlacesManager = NearPlacesManager()
    let searchLocationManager = SearchLocationManager()
    
    
    var body: some View {
        
        NavigationStack{
            VStack {
                Text(place)
                    .padding()
                    .font(.title)
                    .bold()
                    .foregroundColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                    .multilineTextAlignment(.center)
                Text("Cerca de tú " + departingPlace)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .onAppear {
                        // Llama al método de búsqueda al aparecer la vista
                        latitude = searchLocationManager.getSearchLocationLatitude(fromAddress: fromAddress, currentLocation: currrentLocation, addressLocation: addressLocation)
                        longitude = searchLocationManager.getSearchLocationLongitude(fromAddress: fromAddress, currentLocation: currrentLocation, addressLocation: addressLocation)
                        //nearPlacesManager.searchPlacesNearby(latitude: latitude, longitude: longitude, typeOfPlace: place)
                        places = nearPlacesManager.searchNearbyPlaces(location: "\(latitude),\(longitude)",typeOfPlace: typeOfPlace, apiKey: "AIzaSyDIuYq_slSbTjd7HGPN4rajtz1RvuquHr0")
                        
                    }
                Spacer()
                List (places, id: \.id){place in
                    NearPlaceRow(place: place)
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
