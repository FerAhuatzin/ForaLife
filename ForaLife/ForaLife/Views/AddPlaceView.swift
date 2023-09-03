//
//  AddPlaceView.swift
//  ForaLife
//
//  Created by Ricardo Ladislao Martinez Cabrera on 02/09/23.
//

import SwiftUI

struct AddPlaceView: View {
    let categories = ["Deportiva", "Cultural", "Comida", "Salidas nocturnas"]
    @State var university: String = " "
    @State var description: String = ""
    @State var name: String = ""
    @State var selectedCategory = 0
    @Environment(\.managedObjectContext) var managedObjectContext
    var body: some View {
        ZStack {
            Color(hue: 0.374, saturation: 0.846, brightness: 0.426)
                .ignoresSafeArea()
                
            Circle()
                .scale(2.1)
                .foregroundColor(.white.opacity(0.15))
            Circle()
                .scale(1.8)
            .foregroundColor(.white)
            
            VStack {
                Text("Registro")
                    .foregroundColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                    .font(.system(size:50))
                    .padding(.top,0)
                    .padding(.bottom,20)
                
                Text("Nombre del lugar")
                    .foregroundColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                
                    .font(.custom("Roboto", size: 20))
                TextField("Escriba aquí", text: $name)
                    .frame(width: 360, height: 50.0)
                    .foregroundColor(.black)
                    .background(Color.black.opacity(0.05))
                    .font(.custom("Roboto", size: 20))
                    .cornerRadius(10)
                    .padding(.bottom)
                
                
                Picker(selection: $selectedCategory, label: Text("Picker")
                            .foregroundColor(.black)) {
                                Text("Selecciona tu categoria")
                                ForEach(0..<categories.count) { index in
                                    Text(categories[index]).tag(index)
                                }
                            }
                
                
                
                Text("Descripción del lugar")
                    .foregroundColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                    .padding(.top)
                    .font(.custom("Roboto", size: 20))
               
                
                TextEditor(text: $name)
                    .frame(width: 360, height: 300.0)
                    .border(Color.gray,width: 1)
                    .background(Color.black.opacity(0.05))
                    .font(.custom("Roboto", size: 20))
                    .cornerRadius(10)
                    .padding(.bottom,10)
                
                Button ("Guardar cambios") {
 
                }
                .frame(width: 200, height: 50.0)
                .foregroundColor(.white)
                .background(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                .background(Color.black.opacity(0.05))
                .font(.custom("Roboto", size: 20))
                .cornerRadius(10)
                
                
            }
            
        }
    }
}

struct AddPlaceView_Previews: PreviewProvider {
    static var previews: some View {
        AddPlaceView()
    }
}
