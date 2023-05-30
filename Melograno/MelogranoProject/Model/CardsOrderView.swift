//
//  CardsOrderView.swift
//  MelogranoProject
//
//  Created by Rita Marrano on 22/05/23.
//

import SwiftUI

struct CardsOrderView: View {
    
    @State var card: CardGame1
    
    var body: some View {
        

        Image(card.imageName)
            .resizable()
            .frame(width: 200, height: 180)
            .background(Color.white) // Imposta il colore di sfondo come bianco
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.purple, lineWidth: 2) // Imposta il colore del bordo come viola
            
                )
               
                

        }
    }
    


//struct CardsOrderView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardsOrderView()
//    }
//}
