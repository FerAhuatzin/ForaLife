//
//  FooterJustClose.swift
//  ForaLife
//
//  Created by Ricardo Ladislao Martinez Cabrera on 02/09/23.
//

import SwiftUI

struct FooterJustClose: View {
    @State private var goToView: Bool = false
    var body: some View {
        NavigationStack {
            HStack {
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

            }
        }
        .navigationDestination(isPresented: $goToView) {
            InitialView()
        }

    }
}

struct FooterJustClose_Previews: PreviewProvider {
    static var previews: some View {
        FooterJustClose()
    }
}
