//
//  MainMenuView.swift
//  ForaLife
//
//  Created by Fernando Ahuatzin Gallardo on 15/06/23.
//

import SwiftUI

struct MainMenuView: View {
    
    @State var user: String
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                
                VStack {

                    Text ("Hola "+user)
                        .font(.title)
                        .bold()
                        .foregroundColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                        .multilineTextAlignment(.center)
                        .navigationBarBackButtonHidden(true)
                
                    Text ("¿A dónde necesitas ir hoy?")
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .navigationBarBackButtonHidden(true)
                       
                    List {
                        HStack {
                            
                            Image(systemName:"fork.knife.circle")
                                .resizable()
                                .frame(width: 50, height:50)
                                .padding()
                            Text("Restaurantes")
                                .font(.title)
                                .foregroundColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                            NavigationLink(destination: InitialView()) {
                                EmptyView()
                            }
                        }
                        HStack {
                            Image(systemName:"cart.circle")
                                .resizable()
                                .frame(width: 50, height:50)
                                .padding()
                            Text("Abarrotes")
                                .font(.title)
                                .foregroundColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                            NavigationLink(destination: InitialView()) {
                                EmptyView()
                            }
                        }
                        HStack {
                            Image(systemName:"cross.case.circle")
                                .resizable()
                                .frame(width: 50, height:50)
                                .padding()
                            Text("Farmacias")
                                .font(.title)
                                .foregroundColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                            NavigationLink(destination: InitialView()) {
                                EmptyView()
                            }
                        }
                        HStack {
                            Image(systemName:"washer")
                                .resizable()
                                .frame(width: 50, height:50)
                                .padding()
                            Text("Lavanderías")
                                .font(.title)
                                .foregroundColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                            NavigationLink(destination: InitialView()) {
                                EmptyView()
                            }
                        }
                        HStack {
                            Image(systemName:"bus.fill")
                                .resizable()
                                .frame(width: 50, height:50)
                                .padding()
                            Text("Paradas de autobús")
                                .font(.title)
                                .foregroundColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                            NavigationLink(destination: InitialView()) {
                                EmptyView()
                            }
                        }
                        
                    }
                    .frame(width: 500, height: 700)
                    HStack {
                    
                           
                            NavigationLink(destination: InitialView()) {
                                Image(systemName: "person.crop.circle")
                                    .resizable()
                                    .foregroundColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                                    .frame(width: 30, height:30)
                                Text("Perfil")
                                    .foregroundColor(Color.black)
                                   
                            }
                        
                           
                            NavigationLink(destination: InitialView()) {
                                Image(systemName: "x.circle")
                                    .resizable()
                                    .foregroundColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                                    .frame(width:30,height: 30)
                                Text("Cerrar")
                                    .foregroundColor(Color.black)
                                    
                            }
                        NavigationLink(destination: InitialView()) {
                            Image(systemName: "questionmark.circle.fill")
                                .resizable()
                                .foregroundColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                                .frame(width:30,height: 30)
                            Text("Acerca de la app")
                                .foregroundColor(Color.black)
                                
                        }

                        
                    }
                    
                }
            }
            
            
        }
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView(user:"Fernando")
    }
}
