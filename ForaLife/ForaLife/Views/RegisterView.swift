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
    @State var selectedUniversity = -1
    @State var correctRegister: Bool = false
    @State var phase: Bool = true
    let sessionManager = SessionManager()
    @State var userAddress: String = ""
    @State var showBorders: [Bool] = [false,false,false,false,false,false,false,false, false, false]
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
                        .border(showBorders[0] ? Color.red : Color.clear)
                    
                    
                    SecureField("Contraseña", text: $password)
                        .padding()
                        .frame(width:300, height:50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(showBorders[1] ? Color.red : Color.clear)
                    
                    SecureField("Confirmar contraseña", text: $confirmedPassword)
                        .padding()
                        .frame(width:300, height:50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(showBorders[2] ? Color.red : Color.clear)
                    
                    HStack {
                        TextField("Nombre", text: $name)
                            .padding()
                            .frame(width:150, height:50)
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(10)
                            .border(showBorders[3] ? Color.red : Color.clear)
                        TextField("Apellido", text: $lastname)
                            .padding()
                            .frame(width:150, height:50)
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(10)
                            .border(showBorders[4] ? Color.red : Color.clear)
                    }
                    
                    Picker(selection: $selectedUniversity, label: Text("Picker")
                                .foregroundColor(.black)) {
                                    Text("Selecciona tu universidad")
                                    ForEach(0..<universities.count) { index in
                                        Text(universities[index]).tag(index)
                                    }
                                }
                                .padding(.top)
                                .border(showBorders[9] ? Color.red : Color.clear)
                    
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
                            .border(showBorders[5] ? Color.red : Color.clear)
                        TextField("Número", text: $number)
                            .padding()
                            .frame(width:100, height:50)
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(10)
                            .border(showBorders[6] ? Color.red : Color.clear)
                    }
                    HStack {
                        TextField("Ciudad", text: $city)
                            .padding()
                            .frame(width:150, height:50)
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(10)
                            .border(showBorders[7] ? Color.red : Color.clear)
                        TextField("Código postal", text: $zip)
                            .padding()
                            .frame(width:150, height:50)
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(10)
                            .border(showBorders[8] ? Color.red : Color.clear)
                        
                    }
                        
                    Button("Crear cuenta") {
                        //Verificar contraseña es igual, guardar en base de datos usuario, contraseña, direccion y coordenadas de la direccion y mostrar ventana confirmación cuenta
                        phase = sessionManager.comparePassword(password: password, verifiedPassword: confirmedPassword)
                        
                            if (username == "") {
                                phase = false
                                showBorders[0] = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                    showBorders[0] = false
                                }
                            }
                            if (password == "") {
                                phase = false
                                showBorders[1] = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                    showBorders[1] = false
                                }
                            }
                            if (confirmedPassword == "") {
                                phase = false
                                showBorders[2] = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                    showBorders[2] = false
                                }
                            }
                            if (password != confirmedPassword) {
                                phase = false
                                showBorders[1] = true
                                showBorders[2] = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                    showBorders[1] = false
                                    showBorders[2] = false
                                }
                            }
                            if (name == "") {
                                phase = false
                                showBorders[3] = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                    showBorders[3] = false
                                }
                            }
                            if (lastname == "") {
                                phase = false
                                showBorders[4] = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                    showBorders[4] = false
                                }
                            }
                            if (street == "") {
                                phase = false
                                showBorders[5] = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                    showBorders[5] = false
                                }
                            }
                            if (number == "") {
                                phase = false
                                showBorders[6] = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                    showBorders[6] = false
                                }
                            }
                            if (city == "") {
                                phase = false
                                showBorders[7] = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                    showBorders[7] = false
                                }
                            }
                            if (zip == "") {
                                phase = false
                                showBorders[8] = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                    showBorders[8] = false
                                }
                            }
                        
                            if (selectedUniversity == -1) {
                                phase = false
                                showBorders[9] = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                    showBorders[9] = false
                                }
                            }
                            
                        
                        if phase {
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


