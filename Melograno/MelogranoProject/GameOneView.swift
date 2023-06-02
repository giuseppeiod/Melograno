//
//  GameOneView.swift
//  MelogranoProject
//
//  Created by Rita Marrano on 30/05/23.
//

import SwiftUI
import UIKit

struct GameOneView: View {
    
    @ObservedObject var model = ModelGameOne()
    @State private var isGameFinishedButton = false
    @State private var showingCongrats = false
    

    var body: some View {

        ZStack{
            VStack(spacing: 30) {
                
                
                HStack() {
                    
                    VStack(alignment: .leading) {
                        Text("Rearrange the following cards in order")
                            .font(.custom("customRegular", size: 46))

                            .multilineTextAlignment(.center)
                            .bold()
                            .padding(.bottom)
                        
                    }
                    Spacer()
                }
                .padding()
                Spacer()
                
                
                HStack(spacing: 20) {
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
                }.id(UUID())
                
                
                HStack(spacing: 10) {
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
                }.id(UUID())
                Spacer()
                
                
    
                
                HStack{
                    Spacer()
                    if model.allCardsPlaced {
                        Button {
                            isGameFinishedButton = true
                            showingCongrats = true
                        } label: {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.purple.opacity(0.9))
                                    .frame(width: 250, height: 70)
                                    .cornerRadius(16)
                                
                                Text("FINISH")
                                    .font(.custom("customRegular", size: 26))
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }
            }//Z
            
            if showingCongrats {
                

                    ZStack {
                        
                        Rectangle()
//                            .stroke(Color.white, lineWidth: 3)
                            .foregroundColor(.purple.opacity(0.9))
                            .frame(width: 650, height: 350)
                        
                            .cornerRadius(16) .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                
                            
                        
                        Text("CONGRATS YOU FINISH THE GAME")
                            .font(.custom("customRegular", size: 36))
                            .foregroundColor(.white)
                        
                       
                    }.onTapGesture {
                        
                        isGameFinishedButton = false
                        showingCongrats = false
                        model.restartGame()
                    }
                }
            
            
        }.onAppear{
            model.restartGame()
        }
}

}

struct GameOneView_Previews: PreviewProvider {
    static var previews: some View {
       GameOneView()
    }
}
