//
//  CommunityViewRow.swift
//  ForaLife
//
//  Created by Fernando Ahuatzin Gallardo on 26/06/23.
//

import SwiftUI

struct CommunityViewRow: View {
    let place: ForeignPlaces?
    var body: some View {
        VStack{
            Text(place?.placeName ?? "No description")
                .bold()
            Text(place?.placeInfo ?? "No description")
        }
        
    }
}

/*struct CommunityViewRow_Previews: PreviewProvider {
    static var previews: some View {
        CommunityViewRow(place: ForeignPlaces())
    }
}*/
