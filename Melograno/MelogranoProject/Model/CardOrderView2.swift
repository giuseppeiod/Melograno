//
//  CardOrderView2.swift
//  MelogranoProject
//
//  Created by Giuseppe Iodice on 22/05/23.
//

import SwiftUI


struct CardsOrderView2: View {
    
    @State var card: WorldCard
    
    var body: some View {
        

        ZStack{
            
            VStack{
                
                Image(card.imageName)
                    .resizable()
                    .cornerRadius(3)
                    .frame(width: 100, height: 100)
                    .background(.blue)
                
                
                Text(card.text)
                    .frame(width: 100, height: 20)
                    .background(Color.green)
                    .cornerRadius(3)
            }
        }
        }
    }
    

struct CardsOrderView2_Previews: PreviewProvider {
    static var previews: some View {
        CardsOrderView2(card: WorldCard(id: 1, text: "", imageName: "uno"))
    }
}

