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
    @State var correctCredentials: Bool = false
    @State var showBorders: Bool = false
    @State var user: User?
    @ObservedObject var currentLocationManager = CurrentLocationManager()
    @Environment(\.managedObjectContext) var managedObjectContext
    let sessionManager = SessionManager()
var body: some View {
NavigationStack {
    
        ZStack {
            Color(hue: 0.374, saturation: 0.846, brightness: 0.426)
                .ignoresSafeArea()
                .navigationBarBackButtonHidden(true)
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
                    .border(showBorders ? Color.red : Color.clear)
                SecureField("Contraseña", text: $password)
                    .padding()
                    .frame(width:300, height:50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    .border(showBorders ? Color.red : Color.clear)
                Button("Confirmar") {
                    CoreDataManager().fetchUser(username: username, password: password, context: managedObjectContext) { credential, fetchedUser in
                        user  = fetchedUser
                        print(user?.name ?? " ")
                        print(user?.address ?? " ")
                        if !credential {
                            showBorders = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                showBorders = false
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
                .onChange(of: user) { newUser in
                                if newUser != nil {
                                    correctCredentials = true
                                }
                            }
                Text("¿Es nuevo usuario?")
                NavigationLink(destination: RegisterView()) {
                    Text("Cree su cuenta")
                        .foregroundColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                }
            
            }
        }
        .navigationDestination(isPresented: $correctCredentials) {
            MainMenuView(user: user ?? User())
        }
}

}
}

struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView()
    }
}
