//
//  Footer.swift
//  ForaLife
//
//  Created by Fernando Ahuatzin Gallardo on 16/06/23.
//

import SwiftUI

struct Footer: View {
    @State var user: User?
    @State private var goToView: Bool = false

    
    var body: some View {
        NavigationStack {
            HStack {
                               
                NavigationLink(destination: ProfileView(user: user ?? User())) {
                    VStack{
                        Image(systemName: "person.circle")
                            .resizable()
                            .frame(width:20,height: 20)
                            .foregroundColor(Color.black)

                        Text("Perfil")
                            .font(.subheadline)
                            .foregroundColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                    }
                }
                .padding()

                VStack {
                        Image(systemName: "x.circle")
                            .resizable()
                            .frame(width:20,height: 20)
                            .foregroundColor(Color.black)
                        Text("Cerrar")
                            .font(.subheadline)
                            .foregroundColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                    }
                    .onTapGesture {
                        goToView.toggle()
                }

                .padding()
                NavigationLink(destination: AboutTheAppView()) {
                    VStack {
                        Image(systemName: "questionmark.app")
                            .resizable()
                            .frame(width:20,height: 20)
                            .foregroundColor(Color.black)
                        Text("App")
                            .font(.subheadline)
                            .foregroundColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                    }
                }
                .padding()
            }
        }
        .navigationDestination(isPresented: $goToView) {
            InitialView()
        }

        
        
    }
}

struct Footer_Previews: PreviewProvider {
    static var previews: some View {
        Footer()
    }
}
