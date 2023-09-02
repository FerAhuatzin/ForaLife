//
//  RegisterView.swift
//  ForaLife
//
//  Created by Fernando Ahuatzin Gallardo on 15/06/23.
//

import SwiftUI
import UIKit

struct RegisterView: View {
    @State public var username: String = ""
    @State var password: String = ""
    @State var confirmedPassword: String = ""
    @State var name: String = ""
    @State var lastname: String = ""
    @State var street: String = ""
    @State var number: String = ""
    @State var city: String = ""
    @State var zip: String = ""
    @State var latitude: Double = 0.0
    @State var longitude: Double = 0.0
    @State var selectedUniversity = 0
    @State var correctRegister: Bool = false
    @State var phase: Bool = false
    let sessionManager = SessionManager()
    @State var userAddress: String = ""
    @State var showBorders: [Bool] = [false,false,false,false,false,false,false,false, false]
    let universities = ["UDLAP", "BUAP", "Tecnologico de Monterrey", "Ibero Puebla", "Anahuac Puebla", "UPAEP"]
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                Color(hue: 0.374, saturation: 0.846, brightness: 0.426)
                    .ignoresSafeArea()
                Circle()
                    .scale(2)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white)
                VStack(alignment: .center) {
                    
                    Text("Datos de la cuenta")
                        .bold()
                        .padding()
                        .font(.largeTitle)
                    
                    TextField("Usuario", text: $username)
                        .padding()
                        .frame(width:300, height:50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                    
                    
                    SecureField("Contraseña", text: $password)
                        .padding()
                        .frame(width:300, height:50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(showBorders[0] ? Color.red : Color.clear)
                    
                    SecureField("Confirmar contraseña", text: $confirmedPassword)
                        .padding()
                        .frame(width:300, height:50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(showBorders[1] ? Color.red : Color.clear)
                    
                    HStack {
                        TextField("Nombre", text: $name)
                            .padding()
                            .frame(width:150, height:50)
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(10)
                        TextField("Apellido", text: $lastname)
                            .padding()
                            .frame(width:150, height:50)
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(10)
                    }
                    
                    Picker(selection: $selectedUniversity, label: Text("Picker")
                                .foregroundColor(.black)) {
                                    Text("Selecciona tu universidad")
                                    ForEach(0..<universities.count) { index in
                                        Text(universities[index]).tag(index)
                                    }
                                }
                                .padding(.top)
                    
                    Text ("Dirección")
                        .bold()
                        .padding()
                        .font(.largeTitle)
                    HStack {
                        TextField("Calle", text: $street)
                            .padding()
                            .frame(width:200, height:50)
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(10)
                        TextField("Número", text: $number)
                            .padding()
                            .frame(width:100, height:50)
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(10)
                        
                    }
                    HStack {
                        TextField("Ciudad", text: $city)
                            .padding()
                            .frame(width:150, height:50)
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(10)
                        TextField("Código postal", text: $zip)
                            .padding()
                            .frame(width:150, height:50)
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(10)
                        
                    }
                        
                    Button("Crear cuenta") {
                        //Verificar contraseña es igual, guardar en base de datos usuario, contraseña, direccion y coordenadas de la direccion y mostrar ventana confirmación cuenta
                        phase = sessionManager.comparePassword(password: password, verifiedPassword: confirmedPassword)
                        if !phase {
                            showBorders[0] = true
                            showBorders[1] = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                showBorders[0] = false
                                showBorders[1] = false
                            }
                        }
                        else {
                            correctRegister = true
                            //aqui se manda a llamar para ver que no haya espacios vacios si el arreglo esta vacio correctRegister es true si esta con elementos es false y se recorre el arreglo sacando los index para volver showBorders true en tales posiciones
                            userAddress = "\(street) \(number) \(city) \(zip)"
                            let manager = AddressLocationManager()
                            manager.convertAddressToCoordinates(address: userAddress) { (coordinates) in
                                if let receivedLatitude = coordinates?.0, let receivedLongitude = coordinates?.1 {
                                    latitude = receivedLatitude
                                    longitude = receivedLongitude
                                    CoreDataManager().addUser(username: username, universityName: universities[selectedUniversity], password: password, longitude: longitude, latitude: latitude, address: userAddress, name: name, lastname: lastname, context: managedObjectContext)
                                    CoreDataManager().showUser(context: managedObjectContext)
                                    //CoreDataManager().addForeignPlaces(placename: "Casa verde", placeDescription: "Los martes voy a casa verde que está en una privada a lado de Leudo para cenar gratis y luego saliendo voy a martes de casa de Chucho", universityName: universities[selectedUniversity], context: managedObjectContext)
                                    //CoreDataManager().addForeignPlaces(placename: "Retas de fut", placeDescription: "De lunes a viernes hay retas como desde las 6:00 de la tarde hasta las 9:00 o hasta las 11:00 en la cancha de rápido que está atrás de ingenierías", universityName: universities[selectedUniversity], context: managedObjectContext)
                                    
                                    CoreDataManager().showForeignPlaces(context: managedObjectContext)
                                    //CoreDataManager().deleteUsers(context: managedObjectContext)
                                    //CoreDataManager().deleteForeignPlaces(context: managedObjectContext)
                                    dismiss()
                                } else {
                                    print("No se pudo obtener la latitud y longitud")
                                }
                            }
                            
      
                            //-MARK: Save User Preferences
                            /*UserDefaults.standard.set(username, forKey: "Username")
                            UserDefaults.standard.set(password, forKey: "Password")
                            UserDefaults.standard.set(confirmedPassword, forKey: "CPassword")
                            UserDefaults.standard.set(userAddress, forKey: "Address")
                            //UserDefaults.standard.synchronize()
                            //showAlert(message: "Se han guardado tus datos", viewController: self)
                            
                            //- MARK: Get user Preferences

                            let kusername =  UserDefaults.standard.string(forKey: "Username")
                            let kaddress = UserDefaults.standard.string(forKey: "Address")
                            let kpass = UserDefaults.standard.string(forKey: "Password")
                            let kcpass = UserDefaults.standard.string(forKey: "CPassword")
                            //UserDefaults.standard.synchronize()

                                print("Username: \(kusername), password: \(kpass), Direccion: \(kaddress)")*/
                        }
                        
                    }
                    .padding()
                    .foregroundColor(Color.white )
                    .frame(width:300, height:50)
                    .background(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                    .cornerRadius(10)
                    .padding()

                
                }
            }
            /*.navigationDestination(isPresented: $correctRegister) {
                MainMenuView(user: username)
            }*/
            
        }
        
    }
}






struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

private func showAlert(message: String, viewController: UIViewController) {
    let alert = UIAlertController(title: "My User Default", message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default,handler: nil))
    viewController.present(alert, animated: true, completion: nil)
}


