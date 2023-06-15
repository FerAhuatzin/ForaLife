//
//  RegisterView.swift
//  ForaLife
//
//  Created by Fernando Ahuatzin Gallardo on 15/06/23.
//

import SwiftUI

struct RegisterView: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var confirmedPassword: String = ""
    var body: some View {
        ZStack {
            Color(hue: 0.374, saturation: 0.846, brightness: 0.426)
                .ignoresSafeArea()
            Circle()
                .scale(1.7)
                .foregroundColor(.white.opacity(0.15))
            Circle()
                .scale(1.35)
                .foregroundColor(.white)
            VStack(alignment: .center) {
                
                Text("Registro nueva cuenta")
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
               
                SecureField("Confirmar contraseña", text: $confirmedPassword)
                    .padding()
                    .frame(width:300, height:50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    
                Button("Crear cuenta") {
                    //Verificar contraseña es igual, guardar en base de datos y mostrar ventana confirmación cuenta
                }
                .padding()
                .foregroundColor(Color.white )
                .frame(width:300, height:50)
                .background(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                .cornerRadius(10)
                .padding()
                
            
            }
        }    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
