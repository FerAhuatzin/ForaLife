//
//  NearPlaceRow.swift
//  ForaLife
//
//  Created by Fernando Ahuatzin Gallardo on 16/06/23.
//

import SwiftUI

struct NearPlaceRow: View {
    @State var place: Place
    var body: some View {
        HStack {
            place.image
                .resizable()
                .frame(width: 50, height:50)
                .padding()
            Spacer()
            NavigationLink(destination: PlaceAddressView()){
                VStack (alignment: .leading){
                    Text(place.name)
                        .bold()
                        .foregroundColor(Color.black)
                    Text("Open:\(place.open)")
                        .foregroundColor(Color.gray)
                    Text("$\(place.priceLevel)")
                        .foregroundColor(Color.gray)
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
        NearPlaceRow(place:Place(id: 0, name: "mrTaco", open: 1, priceLevel: 2, rating: 4.7, latitude: 44.0, longitude: 888.0, image: Image(systemName: "fork.knife")))
    }
}
