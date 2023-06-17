//
//  Footer.swift
//  ForaLife
//
//  Created by Fernando Ahuatzin Gallardo on 16/06/23.
//

import SwiftUI

struct Footer: View {
    var body: some View {
        NavigationStack {
            HStack {
                               
                NavigationLink(destination: RegisterView()) {
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
                NavigationLink(destination: RegisterView()) {
                    VStack {
                        Image(systemName: "x.circle")
                            .resizable()
                            .frame(width:20,height: 20)
                            .foregroundColor(Color.black)
                        Text("Cerrar")
                            .font(.subheadline)
                            .foregroundColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                    }
                }
                .padding()
                NavigationLink(destination: RegisterView()) {
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
    }
}

struct Footer_Previews: PreviewProvider {
    static var previews: some View {
        Footer()
    }
}
