
//  CommunityView.swift
//  ForaLife
//
//  Created by Ricardo Ladislao Martinez Cabrera on 22/06/23.
//
import SwiftUI

struct CommunityView: View {
    
    let university: String
    @State var aportation: String = ""
    @State var name: String = ""
    @State var category: String = "Todas"
    @State var foreignPlaces: [ForeignPlaces]?
    @Environment(\.managedObjectContext) var managedObjectContext
    
    var body: some View {

        NavigationStack {
            
            VStack(alignment: .center) {

                Text("Lugares populares")
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))

                Text("cerca de: " + university)
                    .lineLimit(0)
                    .bold()
                    .font(.title)
                    .padding(.bottom)
                Menu("Escoger Categoría") {
                    Button("Todas"){
                            category  = "Todas"
                        }
                    Button("Deportiva"){
                            category  = "Deportiva"
                        }
                    Button("Cultural"){
                            category = "Cultural"
                        }
                    Button("Comida"){
                            category = "Comida"
                        }
                    Button("Salidas nocturnas"){
                            category = "Salidas nocturnas"
                        }
                }
                .foregroundColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                Spacer()
                List(foreignPlaces ?? [], id: \.self) { place in
                    if (category.contains("Todas")) {
                        CommunityViewRow(place: place)
                    }
                    else {
                        if (category.contains(place.category ?? " ")) {
                            CommunityViewRow(place: place)
                        }
                    }
                    
                    
                }
                .onAppear {
                    CoreDataManager().showForeignPlaces(context: managedObjectContext)
                    CoreDataManager().fetchForeignPlaces(universityName: university, context: managedObjectContext) { places in
                        foreignPlaces = places ?? [ForeignPlaces()]
                        if let firstPlace = foreignPlaces?.first {
                            print("Primer lugar:"+(firstPlace.placeName ?? "---"))
                        } else {
                            print("Error al intentar sacar el primer elemento")
                        }
                    }
                }
                

                


                NavigationLink (destination: AddPlaceView(university: university)) {
                    Text("Tengo una sugerencia")
                }
                .padding()
                .foregroundColor(Color.white )
                .frame(width:300, height:50)
                .background(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                .cornerRadius(10)
                .padding()

                Spacer()
                FooterJustClose()

            }
        
        } //end navigationStack

            
        
        


    }
}



/*struct CommunityView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityView(university: "UDLAP")
    }
}*/
