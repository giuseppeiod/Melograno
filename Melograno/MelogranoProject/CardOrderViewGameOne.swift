//
//  CardOrderViewGameOne.swift
//  MelogranoProject
//
//  Created by Rita Marrano on 30/05/23.
//

import SwiftUI

struct CardOrderViewGameOne: View {
    
    @State var card: CardGameOne
    
    var body: some View {
        

        Image(card.imageName)
            .resizable()
            .frame(width: 200, height: 200)
            .background(Color.white)
            .cornerRadius(16).overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.black, lineWidth: 2)
            )
               
                

        }
    }

//struct CardOrderViewGameOne_Previews: PreviewProvider {
//    static var previews: some View {
//        CardOrderViewGameOne()
//    }
//}
