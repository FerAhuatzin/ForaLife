//
//
//  AppView.swift
//  ForaLife
//
//  Created by Ricardo Ladislao Martinez Cabrera on 01/09/23.
//

import SwiftUI

struct ProfileView: View {
    @State var user: User?
    @State var nombreUsuario: String = " "
    @State var Contraseña: String = " "
    @State var Nombre: String = " "
    @State var Apellido: String = " "
    @State var Direccion: String = " "
    @Environment(\.managedObjectContext) var managedObjectContext
    var body: some View {
        ZStack {
            Color(hue: 0.374, saturation: 0.846, brightness: 0.426)
                .ignoresSafeArea()
                .onAppear(){
                    nombreUsuario = user?.userName ?? ""
                    Contraseña = user?.password ?? ""
                    Nombre = user?.name ?? ""
                    Apellido = user?.lastname ?? ""
                    Direccion = user?.address ?? ""
                }
            Circle()
                .scale(2.2)
                .foregroundColor(.white.opacity(0.15))
            Circle()
                .scale(2.05)
                .foregroundColor(.white)
            
            VStack {
                Text("Tu perfil")
                    .foregroundColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                    .font(.system(size:50))
                    .padding(.top,140)
                    .padding(.bottom,20)
                
                
                
                VStack{
                    Text("Nombre de usuario")
                        .foregroundColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                    
                        .font(.custom("Roboto", size: 20))
                    TextField("Nombre de usuario", text: $nombreUsuario)
                        .frame(width: 360, height: 50.0)
                        .foregroundColor(.black)
                        .background(Color.black.opacity(0.05))
                        .font(.custom("Roboto", size: 20))
                        .cornerRadius(10)
                    
                    Text("Contraseña")
                        .foregroundColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                    
                        .font(.custom("Roboto", size: 20))
                    TextField(" Contraseña", text: $Contraseña)
                        .frame(width: 360, height: 50.0)
                        .foregroundColor(.black)
                        .background(Color.black.opacity(0.05))
                        .font(.custom("Roboto", size: 20))
                        .cornerRadius(10)
                    
                }
                
                
                HStack {
                    
                    VStack{
                        Text("Nombre")
                            .foregroundColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                            .font(.custom("Roboto", size: 20))
                            .padding(.top,30)
                        TextField("Nombre", text: $Nombre)
                            .frame(width: 170, height: 50.0)
                            .foregroundColor(.black)
                            .background(Color.black.opacity(0.05))
                            .font(.custom("Roboto", size: 20))
                            .cornerRadius(10)
                    }
                    
                    
                    VStack{
                        Text("Apellido")
                            .foregroundColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                            .font(.custom("Roboto", size: 20))
                            .padding(.top,30)
                        TextField("Apellido", text: $Apellido)
                            .frame(width: 170, height: 50.0)
                            .foregroundColor(.black)
                            .background(Color.black.opacity(0.05))
                            .font(.custom("Roboto", size: 20))
                            .cornerRadius(10)
                    }
                }
                
                
                
                
                
                VStack{
                    Text("Dirección")
                        .foregroundColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                        .font(.custom("Roboto", size: 20))
                        .padding(.top,30)
                    TextField("Dirección", text: $Direccion)
                        .frame(width: 360, height: 50.0)
                        .foregroundColor(.black)
                        .background(Color.black.opacity(0.05))
                        .font(.custom("Roboto", size: 20))
                        .cornerRadius(10)
                }
                
                
                
                Spacer()
                
                
                Spacer()
                Button ("Guardar cambios") {
                    CoreDataManager().editUser(user: user ?? User(), username: nombreUsuario, password: Contraseña, address: Direccion, name: Nombre, lastname: Apellido, context: managedObjectContext)
                }
                .frame(width: 200, height: 50.0)
                .foregroundColor(.white)
                .background(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                .background(Color.black.opacity(0.05))
                .font(.custom("Roboto", size: 20))
                .cornerRadius(10)
                .padding(.top,30)
                .padding(.bottom,200)
                
                
                
            }
        }

    }
    
}





struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

