//
//  NearPlacesView.swift
//  ForaLife
//
//  Created by Fernando Ahuatzin Gallardo on 16/06/23.
//

import SwiftUI

private let places = [
    Place(id:0,name:"MrTaco",image: Image(systemName: "fork.knife.circle"), openingHour: "3:00", closingHour: "12:00", averagePrice: "150",address: "Atzala"),
    Place(id:1,name:"Las kekas",image: Image(systemName: "fork.knife.circle"), openingHour: "3:00", closingHour: "12:00", averagePrice: "80",address: "La Meza"),
    Place(id:2,name:"La terraza",image: Image(systemName: "fork.knife.circle"), openingHour: "3:00", closingHour: "12:00", averagePrice: "110",address: "14 oriente"),
    Place(id:3,name:"Las berenjena",image: Image(systemName: "fork.knife.circle"), openingHour: "3:00", closingHour: "12:00", averagePrice: "180",address: "8 norte")
]

struct NearPlacesView: View {
    @State var place: String
    @State var fromAddress: Bool
    @State var departingPlace: String = " hogar"
    
    
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
        NearPlacesView(place: "Restaurantes", fromAddress: true)
    }
}
