//
//  PlaceAddressView.swift
//  ForaLife
//
//  Created by Fernando Ahuatzin Gallardo on 16/06/23.
//

import SwiftUI

struct PlaceAddressView: View {
    //con routes de la direccion de entrada trazar mapa hacia el destino
    @State var latitude: Double
    @State var longitude: Double
    var body: some View {
        Text("\(latitude),\(longitude)")
    }
}


struct PlaceAddressView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceAddressView(latitude:0.0,longitude:0.0)
    }
}
