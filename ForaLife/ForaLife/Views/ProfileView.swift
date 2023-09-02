//
//
//  AppView.swift
//  ForaLife
//
//  Created by Ricardo Ladislao Martinez Cabrera on 01/09/23.
//

import SwiftUI

struct ProfileView: View {
    @State var nombreUsuario: String
    @State var Nombre: String
    @State var Apellido: String
    @State var Calle: String
    @State var Numero: String
    @State var Ciudad: String
    @State var codigoPostal: String
    
    var body: some View {
        ZStack {
            Color(hue: 0.374, saturation: 0.846, brightness: 0.426)
                .ignoresSafeArea()
            Circle()
                .scale(2.2)
                .foregroundColor(.white.opacity(0.15))
            Circle()
                .scale(2)
                .foregroundColor(.white)
        VStack {
            Text("Tu perfil")
                .foregroundColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                .font(.system(size:40))
                .padding(.top,20)
                
            Text("Nombre de usuario")
                .foregroundColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                .font(.custom("Roboto", size: 20))
            TextField("Nombre de usuario", text: $nombreUsuario)
                .frame(width: 300, height: 50.0)
                .foregroundColor(.black)
                .background(Color.black.opacity(0.05))
                .font(.custom("Roboto", size: 20))
                .cornerRadius(10)
            HStack {
                VStack{
                Text("Nombre")
                    .foregroundColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                    .font(.custom("Roboto", size: 20))
                TextField("Nombre", text: $Nombre)
                    .frame(width: 180, height: 50.0)
                    .foregroundColor(.black)
                    .background(Color.black.opacity(0.05))
                    .font(.custom("Roboto", size: 20))
                    .cornerRadius(10)
                }
                VStack{
                    Text("Apellido")
                        .foregroundColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                        .font(.custom("Roboto", size: 20))
                    TextField("Apellido", text: $Apellido)
                        .frame(width: 180, height: 50.0)
                        .foregroundColor(.black)
                        .background(Color.black.opacity(0.05))
                        .font(.custom("Roboto", size: 20))
                        .cornerRadius(10)
                }
            }
            
            HStack{
                VStack{
                    Text("Calle")
                        .foregroundColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                        .font(.custom("Roboto", size: 20))
                    TextField("Calle", text: $Calle)
                        .frame(width: 180, height: 50.0)
                        .foregroundColor(.black)
                        .background(Color.black.opacity(0.05))
                        .font(.custom("Roboto", size: 20))
                        .cornerRadius(10)
                }
                VStack{
                    Text("Numero")
                        .foregroundColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                        .font(.custom("Roboto", size: 20))
                    TextField("Numero", text: $Numero)
                        .frame(width: 180, height: 50.0)
                        .foregroundColor(.black)
                        .background(Color.black.opacity(0.05))
                        .font(.custom("Roboto", size: 20))
                        .cornerRadius(10)
                    
                }
                
            }
            Spacer()
            
            HStack{
                VStack{
                    Text("Ciudad")
                        .foregroundColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                        .font(.custom("Roboto", size: 20))
                    TextField("Ciudad", text: $Ciudad)
                        .frame(width: 180, height: 50.0)
                        .foregroundColor(.black)
                        .background(Color.black.opacity(0.05))
                        .font(.custom("Roboto", size: 20))
                        .cornerRadius(10)
                }
                VStack{
                    Text("Codigo Postal")
                        .foregroundColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                        .font(.custom("Roboto", size: 20))
                    TextField("Codigo Postal", text: $codigoPostal)
                        .frame(width: 180, height: 50.0)
                        .foregroundColor(.black)
                        .background(Color.black.opacity(0.05))
                        .font(.custom("Roboto", size: 20))
                        .cornerRadius(10)
                }
                
            }
            Spacer()
            Button ("Guardar cambios") {
                
            }
            .frame(width: 200, height: 50.0)
            .foregroundColor(.white)
            .background(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
            .background(Color.black.opacity(0.05))
            .font(.custom("Roboto", size: 20))
            .cornerRadius(10)
            .padding(.bottom,200)
            
            
        }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(nombreUsuario: "Ladismtz", Nombre: "Ladislao", Apellido: "Martinez", Calle: "Primavera", Numero: "15", Ciudad: "Cuernavaca", codigoPostal: "62554")
    }
}

