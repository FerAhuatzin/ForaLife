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
    @State var kilometers = 2.0
    @State var isEditing = false
    let numberFormatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal // Estilo de formato decimal
            formatter.maximumFractionDigits = 1 // Número de decimales permitidos
            return formatter
        }()
    
    var body: some View {
    
        NavigationStack {
                
                VStack {

                    Text ("Hola "+(user?.name ?? "Usuario"))
                        .padding(.top)
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                        .multilineTextAlignment(.center)
                        .navigationBarBackButtonHidden(true)
                
                    Text ("¿A dónde necesitas ir hoy?")
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .padding(.bottom)
                    Spacer()
                       
                    List {
                        HStack {
                            Image(systemName:"fork.knife.circle")
                                .resizable()
                                .frame(width: 40, height:40)
                                .padding()
                            Text("Restaurantes")
                                .font(.title3)
                                .foregroundColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                            NavigationLink(destination: NearPlacesView(place: "Restaurantes",typeOfPlace: "restaurant",fromAddress: fromAddress, addressLocation: AddressLocation(latitude: user?.latitude ?? 0.0, longitude: user?.longitude ?? 0.0), km: kilometers)) {
                                EmptyView()
                            }
                        }
                        HStack {
                            Image(systemName:"cart.circle")
                                .resizable()
                                .frame(width: 40, height:40)
                                .padding()
                            Text("Supers")
                                .font(.title3)
                                .foregroundColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                            NavigationLink(destination: NearPlacesView(place: "Supermercados",typeOfPlace: "supermarket", fromAddress: fromAddress, addressLocation: AddressLocation(latitude: user?.latitude ?? 0.0, longitude: user?.longitude ?? 0.0), km: kilometers)) {
                                EmptyView()
                            }
                        }
                        HStack {
                            Image(systemName:"cross.case.circle")
                                .resizable()
                                .frame(width: 40, height:40)
                                .padding()
                            Text("Farmacias")
                                .font(.title3)
                                .foregroundColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                            NavigationLink(destination: NearPlacesView(place: "Farmacias",typeOfPlace: "pharmacy", fromAddress: fromAddress, addressLocation: AddressLocation(latitude: user?.latitude ?? 0.0, longitude: user?.longitude ?? 0.0), km: kilometers)) {
                                EmptyView()
                            }
                        }
                        HStack {
                            Image(systemName:"washer")
                                .resizable()
                                .frame(width: 40, height:40)
                                .padding()
                            Text("Lavanderías")
                                .font(.title3)
                                .foregroundColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                            NavigationLink(destination: NearPlacesView(place: "Lavanderías", typeOfPlace: "laundry",fromAddress: fromAddress, addressLocation: AddressLocation(latitude: user?.latitude ?? 0.0, longitude: user?.longitude ?? 0.0), km: kilometers)) {
                                EmptyView()
                            }
                        }
                        HStack {
                            Image(systemName:"creditcard.circle")
                                .resizable()
                                .frame(width: 40, height:40)
                                .padding()
                            Text("Cajeros automáticos")
                                .font(.title3)
                                .foregroundColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                            NavigationLink(destination: NearPlacesView(place: "Cajeros automáticos",typeOfPlace: "atm", fromAddress: fromAddress, addressLocation: AddressLocation(latitude: user?.latitude ?? 0.0, longitude: user?.longitude ?? 0.0), km: kilometers)) {
                                EmptyView()
                            }
                        }
                        
                        HStack {
                            Image(systemName:"person.3.fill")
                                .resizable()
                                .frame(width: 40, height:20)
                                .padding()
                            Text("Comunidad")
                                .font(.title3)
                                .foregroundColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                            NavigationLink(destination: CommunityView(university: user?.universityName ?? " ")) {
                                EmptyView()
                            }
                        }

                        
                    }
                    
                    
                    Text("¿Desde dónde necesitas ir?")
                        .padding(.top)
                        .font(.title2)
                    HStack {
                        
                        Toggle(isOn: $fromAddress) {
                            HStack {
                                Image(systemName: "house.circle")
                                    .resizable()
                                    .frame(width: 30, height:30)
                                    .padding(.leading)
                               Text("Hogar")
                                    .font(.callout)
                                    .multilineTextAlignment(.center)
                                    .padding(.trailing)
                            }
                        }
                        .frame(width: 175.0)
                        
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
                                    .padding(.trailing)
                            }
                        }
                        .padding(.trailing)
                        .frame(width: 200.0)
                        .onChange(of: fromLocation) { newValue in
                            fromAddress = !fromLocation
                        }
                    }
                    
                    VStack {
                        Text("¿Hasta dónde puedes ir?")
                            .padding()
                            .font(.title2)
                        Slider(
                                    value: $kilometers,
                                    in: 0.5...10,
                                    step: 0.5,
                                    onEditingChanged: { editing in
                                        isEditing = editing
                                    }
                                )
                        .accentColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                        
                        Text("\(numberFormatter.string(from: NSNumber(value: kilometers)) ?? "cargando") km")
                            .foregroundColor(isEditing ? Color(hue: 0.374, saturation: 0.846, brightness: 0.426) : .black)
                    }
                    
                    
                    Spacer()

                    
                    Footer(user:user)
                    
                }
            
            
            
        }
    }
}

/*struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView(user: User(entity: NSEntityDescription, insertInto: <#T##NSManagedObjectContext?#>))
    }
}*/
