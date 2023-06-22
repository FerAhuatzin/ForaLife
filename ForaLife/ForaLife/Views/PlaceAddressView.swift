//
//  PlaceAddressView.swift
//  ForaLife
//
//  Created by Fernando Ahuatzin Gallardo on 16/06/23.
//

import SwiftUI

struct PlaceAddressView: View {
    //con routes de la direccion de entrada trazar mapa hacia el destino
    let sourceLatitude: Double
    let sourceLongitude: Double
    let destinationLatitude: Double
    let destinationLongitude: Double
    var body: some View {
        VStack{
            DirectionsManager(sourceLatitude: sourceLatitude, sourceLongitude: sourceLongitude, destinationLatitude: destinationLatitude, destinationLongitude: destinationLongitude)
            Spacer()
        }
    }
}


struct PlaceAddressView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceAddressView(sourceLatitude: 0.0, sourceLongitude: 0.0, destinationLatitude: 0.0, destinationLongitude: 0.0)
    }
}
