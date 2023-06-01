//
//  GameOneView.swift
//  MelogranoProject
//
//  Created by Rita Marrano on 30/05/23.
//

import SwiftUI

struct GameOneView: View {
    
    @ObservedObject var model = ModelGameOne()
    @State private var isGameFinishedButton = false
    
    
    var body: some View {

        
        VStack(spacing: 20) {
                 
                        
                        HStack {
                            
                            VStack(alignment: .leading) {
                                Text("Rearrange the following cards in order")
                                    .font(.largeTitle)
                                    .multilineTextAlignment(.center)
                                    .bold()
                                    .padding(.bottom)
                           
                            }
                            Spacer()
                        }
                        .padding()
                        Spacer()
                        
                        
                        HStack {
                            ForEach(0..<model.cards.count) { index in
                                
                                
                                
                                
                                CardGameOneView(card: model.cards[index], hiddenCardIDs: $model.hiddenCardIDs, blurredCardIDs: $model.blurredCardIndex)
                                
                                    .onTapGesture {
 
                                        if  model.hiddenCardIDs.contains(model.cards[index].id) {
                                            return
                                        }
                                        
                                        
                                        if !model.cards[index].isBlurred{
                                            
//                                            if model.blurredCardIndex.contains(model.cards[index].id){
//                                                return
//                                            }
                                          //  else {
                                            model.cards[index].selected = true
                                                
                                                let cardID = model.cards[index].id
                                                
                                                model.blurredCardIndex = Set(model.cards.map { $0.id })
                                                
                                                model.blurredCardIndex.remove(cardID)
                                           // }
                                            
                                            
                                        }
                                        
                                        
                                        
                                        
                                        if  model.hiddenCardIDs.contains(model.cards[index].id) {
                                            return
                                        }
                                        
                                        
                                        
                                        model.selectedCardIndex = index
                                        
                                        
                                        
                                    }
                                    
                                    .scaleEffect(model.selectedCardIndex == index ? 1.2 : 1.0)
                                        .border(Color.clear, width: model.selectedCardIndex == index ? 2 : 0)
                            }
                        }
                        
                        
                        HStack {
                            ForEach(model.cardsToOrder.indices, id: \.self) { index in
                                CardOrderViewGameOne(card: model.cardsToOrder[index])
                                    .id(UUID())
                                
                                    .onTapGesture {
                                        
                                        
                                        
                                        if let selectedToOrderIndex = model.selectedCardToOrderIndex {
                                            
                                            
                                            
                                            let selectedCardToOrder = model.cardsToOrder[selectedToOrderIndex]
                                            
                                            
                                            
                                            if selectedCardToOrder.imageName != "" {
                                                
                                                
                                                model.resetCardToOrderImage(at: selectedToOrderIndex)
                                                
                                                
                                                
                                                
                                            }
                                            
                                            
                                        }
                                        
                                        
                                        
                                        model.selectedCardToOrderIndex = index
                                        
                                        model.replaceCardImage()
                                        
                                        model.cardsToOrder = model.cardsToOrder
                                    }
                                
                            }
                        }
                        
                        
                        Spacer()
                        
                        if model.allCardsPlaced {
                            Button {
                                // Handle Finish button action
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.blue)
                                        .frame(width: 250, height: 70)
                                    Text("FINISH")
                                        .font(.body)
                                        .foregroundColor(.white)
                                }
                            }
                        }
                    }
                }

    }

struct GameOneView_Previews: PreviewProvider {
    static var previews: some View {
       GameOneView()
    }
}
