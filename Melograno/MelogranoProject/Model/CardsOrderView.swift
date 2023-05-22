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
                .frame(width: 100, height: 100)
                .background(Color.green)
                .cornerRadius(10)
                

        }
    }
    


//struct CardsOrderView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardsOrderView()
//    }
//}
