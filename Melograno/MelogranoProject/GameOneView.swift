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
                    if isGameFinishedButton {
                        ContentView()
                    } else {
                        
                    
                        HStack {
                            Button(action: {
                                isGameFinishedButton = true
                                print("Button pressed")
                            }) {
                                HStack {
                                    Image(systemName: "chevron.left")
                                        .font(.title)
                                        .foregroundColor(.gray)
                                    Text("Back")
                                        .font(.headline)
                                        .foregroundColor(.gray)
                                }
                            }
                            Spacer()
                        }
                        .padding()
                        
                        
                        
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
}
struct GameOneView_Previews: PreviewProvider {
    static var previews: some View {
       GameOneView()
    }
}
