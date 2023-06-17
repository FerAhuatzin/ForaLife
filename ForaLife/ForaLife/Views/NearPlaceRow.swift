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
            NavigationLink(destination: RegisterView()){
                VStack (alignment: .leading){
                    Text(place.name)
                        .bold()
                        .foregroundColor(Color.black)
                    Text(place.openingHour + "-" + place.closingHour)
                        .foregroundColor(Color.gray)
                    Text("$"+place.averagePrice)
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
        NearPlaceRow(place:Place(id:0,name:"MrTaco",image: Image(systemName: "fork.knife.circle"), openingHour: "3:00", closingHour: "12:00", averagePrice: "150",address: "Atzala"))
    }
}
