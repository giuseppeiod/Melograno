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
                    .background(.white)
                
                    .padding(20)
                Text(card.text)
                    .frame(width: 150, height: 70)
                    
                    .background(Color.purple.opacity(0.90))
                    .foregroundColor(.white)
                    .font(.title)
                    .cornerRadius(10)
            }
        }
        }
    }
    

struct CardsOrderView2_Previews: PreviewProvider {
    static var previews: some View {
        CardsOrderView2(card: WorldCard(id: 1, text: "", imageName: "uno"))
    }
}

