//
//  MainMenuView.swift
//  ForaLife
//
//  Created by Fernando Ahuatzin Gallardo on 15/06/23.
//

import SwiftUI

struct MainMenuView: View {
    
    @State var user: User?
    @State var fromAddress: Bool = true
    @State var fromLocation: Bool = false
    
    var body: some View {
    
        NavigationStack {
                
                VStack {

                    Text ("Hola "+(user?.name ?? "Usuario"))
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
                            NavigationLink(destination: NearPlacesView(place: "Restaurantes",typeOfPlace: "restaurant",fromAddress: fromAddress, addressLocation: AddressLocation(latitude: user?.latitude ?? 0.0, longitude: user?.longitude ?? 0.0))) {
                                EmptyView()
                            }
                        }
                        HStack {
                            Image(systemName:"cart.circle")
                                .resizable()
                                .frame(width: 50, height:50)
                                .padding()
                            Text("Supermercados")
                                .font(.title2)
                                .foregroundColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                            NavigationLink(destination: NearPlacesView(place: "supermercados",typeOfPlace: "supermarket", fromAddress: fromAddress, addressLocation: AddressLocation(latitude: user?.latitude ?? 0.0, longitude: user?.longitude ?? 0.0))) {
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
                            NavigationLink(destination: NearPlacesView(place: "Farmacias",typeOfPlace: "pharmacy", fromAddress: fromAddress, addressLocation: AddressLocation(latitude: user?.latitude ?? 0.0, longitude: user?.longitude ?? 0.0))) {
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
                            NavigationLink(destination: NearPlacesView(place: "Lavanderías", typeOfPlace: "laundry",fromAddress: fromAddress, addressLocation: AddressLocation(latitude: user?.latitude ?? 0.0, longitude: user?.longitude ?? 0.0))) {
                                EmptyView()
                            }
                        }
                        HStack {
                            Image(systemName:"creditcard.circle")
                                .resizable()
                                .frame(width: 50, height:50)
                                .padding()
                            Text("Cajeros automáticos")
                                .font(.title2)
                                .foregroundColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                            NavigationLink(destination: NearPlacesView(place: "Cajeros automáticos",typeOfPlace: "atm", fromAddress: fromAddress, addressLocation: AddressLocation(latitude: user?.latitude ?? 0.0, longitude: user?.longitude ?? 0.0))) {
                                EmptyView()
                            }
                        }
                        
                        HStack {
                            Image(systemName:"person.3.fill")
                                .resizable()
                                .frame(width: 50, height:25)
                                .padding()
                            Text("Comunidad")
                                .font(.title2)
                                .foregroundColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                            NavigationLink(destination: CommunityView(university: user?.universityName ?? " ")) {
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
                        .onChange(of: fromAddress) { newValue in
                            fromLocation = !fromAddress
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
                        .onChange(of: fromLocation) { newValue in
                            fromAddress = !fromLocation
                        }
                    }
                    
                    Spacer()

                    
                    Footer()
                    
                }
            
            
            
        }
    }
}

/*struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView(user: User(entity: NSEntityDescription, insertInto: <#T##NSManagedObjectContext?#>))
    }
}*/
