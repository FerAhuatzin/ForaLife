//
//  AppView.swift
//  ForaLife
//
//  Created by Ricardo Ladislao Martinez Cabrera on 01/09/23.
//

import SwiftUI



struct JustifiedText: View {
    var text: String
    
    var body: some View {
        GeometryReader { geometry in
            Text(text)
                .frame(width: geometry.size.width, alignment: .leading)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}


struct AboutTheAppView: View {
    var body: some View {
        NavigationStack{
            ZStack {
                Color(hue: 0.374, saturation: 0.846, brightness: 0.426)
                    .ignoresSafeArea()
                Circle()
                    .scale(2)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white)
                VStack{
     
                    HStack {
                        
                        Text("¿Que es ForaLife?" )
                            .font(.custom("Roboto",size: 40))
                        
                    }
                    .padding(.top, 100)
                    .padding (.bottom,1)
                    
                    
                    JustifiedText(text: "ForaLife es una aplicación creada por estudiantes foráneos con el objetivo de que los estudiantes con la necesidad de estudiar en otra ciudad puedan encontrar fácilmente servicios y actividades adecuándose a sus necesidades. \n\nEn el menú principal el estudiante será capaz de escoger entre los diferentes servicios en donde podrá seleccionar entre hacer la búsqueda desde el hogar antes proporcionado o su ubicación actual.")
                        .multilineTextAlignment(.center)
                        .padding(.top,60)
                        .padding(.trailing,40)
                        .padding(.leading,40)
                        .font(.custom("Roboto", size: 20))
                    
                    
                    Spacer()
                    Spacer()
          
                }
            }
        }
    }
}

struct AboutTheAppView_Previews: PreviewProvider {
    static var previews: some View {
        AboutTheAppView()
    }
}
