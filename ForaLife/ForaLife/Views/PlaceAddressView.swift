//
//  PlaceAddressView.swift
//  ForaLife
//
//  Created by Fernando Ahuatzin Gallardo on 16/06/23.
//

import SwiftUI

struct PlaceAddressView: View {
    @State var address: String
    //con routes de la direccion de entrada trazar mapa hacia el destino
    var body: some View {
        Text(address)
    }
}

struct PlaceAddressView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceAddressView(address:"Atzala 2002")
    }
}
