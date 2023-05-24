//
//  CardViewGame1.swift
//  MelogranoProject
//
//  Created by Rita Marrano on 22/05/23.
//

import SwiftUI

struct CardViewGame1: View {

    @State var card: CardGame1
    @Binding var hiddenCardIDs: Set<Int>
    
    var isHidden: Bool {
        hiddenCardIDs.contains(card.id)
    }
    
    var body: some View {
        if !isHidden {
            Image(card.imageName)
                .resizable()
                .frame(width: 100, height: 100)
                .background(Color.green)
                .cornerRadius(10)

        } else {
            Image("")
                .resizable()
                .frame(width: 100, height: 100)
                .background(Color.green)
                .cornerRadius(10)

        }
    }
}

//struct CardViewGame1_Previews: PreviewProvider {
//    static var previews: some View {
//        CardViewGame1()
//    }
//}
