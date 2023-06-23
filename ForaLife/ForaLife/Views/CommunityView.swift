//
//  CommunityView.swift
//  ForaLife
//
//  Created by Ricardo Ladislao Martinez Cabrera on 22/06/23.
//

import SwiftUI

struct CommunityView: View {
    @State var aportation: String = ""
    @State var place: Place
    @State var imageArray: [String] = []
    let imageName = "dollarsign.circle"
    @State var price: Int = 0
    @State var correctCredentials: Bool = false
var body: some View {
NavigationStack {
    
        ZStack {
            Color(hue: 0.374, saturation: 0.846, brightness: 0.426)
                .ignoresSafeArea()
        
            Circle()
                .scale(2.1)
                .foregroundColor(.white.opacity(0.15))
            Circle()
                .scale(1.9)
                .foregroundColor(.white)
            VStack(alignment: .center) {
                
                Text("Lugares populares")
                    .bold()
                    .font(.largeTitle)
                
                Text("cerca de tu universidad")
                    .lineLimit(0)
                    .bold()
                    .font(.title)
                
                
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
                    NavigationLink(destination: PlaceAddressView(latitude:place.latitude,longitude: place.longitude)){
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
                .padding(.vertical, 30.0)
                .frame(width:350, height:350)
                
                
                
                
                
                Text("¿Conoces algun otro lugar?")
                    .bold()
                    .font(.title3)
                
                TextField("Escribelo aqui", text: $aportation)
                    .padding()
                    .frame(width:300, height:50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                
                
                Button("Confirmar") {
                    //comprobar usuario y contraseña correcta en base de datos/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    correctCredentials = true
                }
                .padding()
                .foregroundColor(Color.white )
                .frame(width:300, height:50)
                .background(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                .cornerRadius(10)
                .padding()
                

            }
        }
        .navigationDestination(isPresented: $correctCredentials) {

        }
}

}
}



struct CommunityView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityView(place:Place(id: 0, name: "mrTaco", priceLevel: 2, rating: 4.7, latitude: 44.0, longitude: 888.0, image: Image(systemName: "fork.knife")))
    }
}





    
