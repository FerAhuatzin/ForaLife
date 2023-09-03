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
    @State var kilometers = 1.0
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
                            NavigationLink(destination: NearPlacesView(place: "Restaurantes",typeOfPlace: "restaurant",fromAddress: fromAddress, addressLocation: AddressLocation(latitude: user?.latitude ?? 0.0, longitude: user?.longitude ?? 0.0), km: kilometers)) {
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
                            NavigationLink(destination: NearPlacesView(place: "Supermercados",typeOfPlace: "supermarket", fromAddress: fromAddress, addressLocation: AddressLocation(latitude: user?.latitude ?? 0.0, longitude: user?.longitude ?? 0.0), km: kilometers)) {
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
                            NavigationLink(destination: NearPlacesView(place: "Farmacias",typeOfPlace: "pharmacy", fromAddress: fromAddress, addressLocation: AddressLocation(latitude: user?.latitude ?? 0.0, longitude: user?.longitude ?? 0.0), km: kilometers)) {
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
                            NavigationLink(destination: NearPlacesView(place: "Lavanderías", typeOfPlace: "laundry",fromAddress: fromAddress, addressLocation: AddressLocation(latitude: user?.latitude ?? 0.0, longitude: user?.longitude ?? 0.0), km: kilometers)) {
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
                            NavigationLink(destination: NearPlacesView(place: "Cajeros automáticos",typeOfPlace: "atm", fromAddress: fromAddress, addressLocation: AddressLocation(latitude: user?.latitude ?? 0.0, longitude: user?.longitude ?? 0.0), km: kilometers)) {
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
                    
                    VStack {
                        Text("¿Hasta donde puedes ir?")
                            .padding()
                            .font(.title)
                        Slider(
                                    value: $kilometers,
                                    in: 0...10,
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
