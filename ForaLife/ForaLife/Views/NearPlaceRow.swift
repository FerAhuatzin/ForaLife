//
//  NearPlaceRow.swift
//  ForaLife
//
//  Created by Fernando Ahuatzin Gallardo on 16/06/23.
//

import SwiftUI

struct NearPlaceRow: View {
    @State var place: Place
    let sourceLatitude: Double
    let sourceLongitude: Double
    @State var imageArray: [String] = []
    let imageName = "dollarsign.circle"
    @State var price: Int = 0
    
    var body: some View {
        HStack {
            place.image
                .resizable()
                .frame(width: 40, height:40)
                .padding()
                .onAppear{
                    price = place.priceLevel
                    for _ in 0..<price {
                        imageArray.append(imageName)
                    }
                    place.priceLevel = 0
                }
            Spacer()
            NavigationLink(destination: PlaceAddressView(sourceLatitude: sourceLatitude, sourceLongitude: sourceLongitude, destinationLatitude: place.latitude, destinationLongitude: place.longitude)){
                VStack (alignment: .leading){
                    Text(place.name)
                        .bold()
                        .foregroundColor(Color.black)
                    HStack {
                        ForEach(imageArray, id: \.self) { imageName in
                            Image(systemName: imageName)
                                .resizable()
                                .frame(width: 15, height: 15)
                                .foregroundColor(Color.gray)
                            }
                        }
                    Text("Calificación\(place.rating)")
                        .foregroundColor(Color.gray)
                    Text("Ver ubicación")
                        .foregroundColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                }
            }
        }
    }
}

struct NearPlaceRow_Previews: PreviewProvider {
    static var previews: some View {
        NearPlaceRow(place:Place(id: 0, name: "mrTaco", priceLevel: 2, rating: 4.7, latitude: 44.0, longitude: 888.0, image: Image(systemName: "fork.knife"), distanceToPlace: 22.0), sourceLatitude: 0.0, sourceLongitude: 0.0)
    }
}
