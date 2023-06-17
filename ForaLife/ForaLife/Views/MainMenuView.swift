//
//  MainMenuView.swift
//  ForaLife
//
//  Created by Fernando Ahuatzin Gallardo on 15/06/23.
//

import SwiftUI

struct MainMenuView: View {
    
    @State var user: String
    @State var fromAddress: Bool = true
    @State var fromLocation: Bool = false
    
    var body: some View {
        
        NavigationStack {
                
                VStack {

                    Text ("Hola "+user)
                        .padding()
                        .font(.title)
                        .bold()
                        .foregroundColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                        .multilineTextAlignment(.center)
                        .navigationBarBackButtonHidden(true)
                
                    Text ("¿A dónde necesitas ir hoy?")
                        .font(.title)
                        .multilineTextAlignment(.center)
                    Spacer()
                       
                    List {
                        HStack {
                            Image(systemName:"fork.knife.circle")
                                .resizable()
                                .frame(width: 50, height:50)
                                .padding()
                            Text("Restaurantes")
                                .font(.title2)
                                .foregroundColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                            NavigationLink(destination: NearPlacesView(place: "Restaurantes", fromAddress: fromAddress)) {
                                EmptyView()
                            }
                        }
                        HStack {
                            Image(systemName:"cart.circle")
                                .resizable()
                                .frame(width: 50, height:50)
                                .padding()
                            Text("Abarrotes")
                                .font(.title2)
                                .foregroundColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                            NavigationLink(destination: NearPlacesView(place: "Abarrotes", fromAddress: fromAddress)) {
                                EmptyView()
                            }
                        }
                        HStack {
                            Image(systemName:"cross.case.circle")
                                .resizable()
                                .frame(width: 50, height:50)
                                .padding()
                            Text("Farmacias")
                                .font(.title2)
                                .foregroundColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                            NavigationLink(destination: NearPlacesView(place: "Farmacias", fromAddress: fromAddress)) {
                                EmptyView()
                            }
                        }
                        HStack {
                            Image(systemName:"washer")
                                .resizable()
                                .frame(width: 50, height:50)
                                .padding()
                            Text("Lavanderías")
                                .font(.title2)
                                .foregroundColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                            NavigationLink(destination: NearPlacesView(place: "Lavanderías", fromAddress: fromAddress)) {
                                EmptyView()
                            }
                        }
                        HStack {
                            Image(systemName:"bus.fill")
                                .resizable()
                                .frame(width: 50, height:50)
                                .padding()
                            Text("Paradas de autobús")
                                .font(.title2)
                                .foregroundColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                            NavigationLink(destination: NearPlacesView(place: "Paradas de aurobús", fromAddress: fromAddress)) {
                                EmptyView()
                            }
                        }
                        
                    }
                    
                    
                    Text("¿Desde dónde necesitas ir?")
                        .padding()
                        .font(.title)
                    HStack {
                        
                        Toggle(isOn: $fromAddress) {
                            HStack {
                                Image(systemName: "house.circle")
                                    .resizable()
                                    .frame(width: 30, height:30)
                                    .padding()
                               Text("Hogar")
                                    .font(.callout)
                                    .multilineTextAlignment(.center)
                            }
                        }
                        
                        Toggle(isOn: $fromLocation) {
                            HStack {
                                Image(systemName: "mappin.circle")
                                    .resizable()
                                    .frame(width: 30, height:30)
                                Text("Ubicación")
                                    .font(.callout)
                                    .multilineTextAlignment(.center)
                            }
                        }
                        .padding()
                    }                    
                    
                    Spacer()
                    //aplicar que si uno esta prendido el otro debe de estar apagado
                    //usar el que esta en true para sguiente página
                    
                    Footer()  
                    
                }
            
            
            
        }
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView(user:"Fernando")
    }
}
