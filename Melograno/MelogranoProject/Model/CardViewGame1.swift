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
                .frame(width: 200, height: 180)
                .background(Color.purple)
                .cornerRadius(16).overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.black, lineWidth: 2)
                )

        } else {
            Image("")
                .resizable()
                .frame(width: 200, height: 180)
                .background(Color.blue)
                .blur(radius: 100)
                .cornerRadius(16)
                .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.black, lineWidth: 2)
                            )

        }
    }
}

//struct CardViewGame1_Previews: PreviewProvider {
//    static var previews: some View {
//        CardViewGame1()
//    }
//}
