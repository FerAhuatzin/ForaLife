
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
    @State var foreignPlaces: [ForeignPlaces]?
    @Environment(\.managedObjectContext) var managedObjectContext
    
var body: some View {


            VStack(alignment: .center) {

                Text("Lugares populares")
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))

                Text("cerca de: " + university)
                    .lineLimit(0)
                    .bold()
                    .font(.title)
                Spacer()
                List(foreignPlaces ?? [], id: \.self) { place in
                    CommunityViewRow(place: place)
                    
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
                

                Text("¿Conoces algun otro lugar?")
                    .bold()
                    .font(.title3)
                
                TextField("Escribe el título del lugar aquí", text: $name)
                    .padding()
                    .frame(width:300, height:50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)

                TextField("Escribe la descripción aquí", text: $aportation)
                    .padding()
                    .frame(width:300, height:100)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)


                Button("Enviar suerencia") {
                    CoreDataManager().addForeignPlaces(placename: name, placeDescription: aportation, universityName: university, context: managedObjectContext)
                }
                .padding()
                .foregroundColor(Color.white )
                .frame(width:300, height:50)
                .background(Color(hue: 0.374, saturation: 0.846, brightness: 0.426))
                .cornerRadius(10)
                .padding()

                Spacer()
                Footer()

            }
        
        


}
}



/*struct CommunityView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityView(university: "UDLAP")
    }
}*/
