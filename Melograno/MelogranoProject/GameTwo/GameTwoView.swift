//
//  GameTwoView.swift
//  MelogranoProject
//
//  Created by Giuseppe Iodice on 31/05/23.
//

import SwiftUI

struct GameTwoView: View {
    
    @ObservedObject var model = ModelGameTwo()
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
                                
                                
                                
                                
                                CardGameTwoView(card: model.cards[index], hiddenCardIDs: $model.hiddenCardIDs, blurredCardIDs: $model.blurredCardIndex)
                                
                                    .onTapGesture {
 
                                        if !model.cards[index].isBlurred{
                                            
                                            if model.blurredCardIndex.contains(model.cards[index].id){
                                                return
                                            } else {
                                                
                                                model.blurredCardIndex.removeAll()
                                                
                                                model.blurredCardIndex.insert(model.cards[index].id)
                                            }
                                            
                                            
                                        }
                                        
                                        
                                        
                                        
                                        if  model.hiddenCardIDs.contains(model.cards[index].id) {
                                            return
                                        }
                                        
                                        
                                        
                                        model.selectedCardIndex = index
                                        
                                        
                                        
                                    }
                            }
                        }
                        
                        
                        HStack {
                            ForEach(model.cardsToOrder.indices, id: \.self) { index in
                                CardOrderViewGameTwo(card: model.cardsToOrder[index])
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
struct GameTwoView_Previews: PreviewProvider {
    static var previews: some View {
       GameTwoView()
    }
}