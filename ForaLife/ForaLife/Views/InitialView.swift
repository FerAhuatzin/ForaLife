//
//  InitialView.swift
//  ForaLife
//
//  Created by Fernando Ahuatzin Gallardo on 15/06/23.
//

import SwiftUI

struct InitialView: View {
    @State var username: String = ""
    @State var password: String = ""
    
var body: some View {
NavigationView {
    
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
                
                Text("Iniciar sesión")
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
                    
                Button("Confirmar") {
                    //comprobar usuario y contraseña correcta en base de datos/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                .padding()
                .foregroundColor(Color.white )
                .frame(width:300, height:50)
                .background(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                .cornerRadius(10)
                .padding()
                
                Text("¿Es nuevo usuario?")
                NavigationLink(destination: RegisterView()) {
                    Text("Registrese")
                }
            
            }
        }
}

}
}

struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView()
    }
}
