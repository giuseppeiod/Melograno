//
//  Game2View.swift
//  MelogranoProject
//
//  Created by Giuseppe Iodice on 22/05/23.
//

import SwiftUI
import SwiftUI

struct Game2View: View {
    @ObservedObject var model = ViewModelGame2()
    @State private var isGameFinishedButton = false
    
    
    var body: some View {
        if isGameFinishedButton{
            ContentView()
        }else{
            VStack {
                
                Button(action: {
                    
                    isGameFinishedButton = true
                    
                    print("Button pressed")
                    
                    
                }) {
                    Image(systemName: "xmark")
                        .font(.title)
                        .foregroundColor(.gray)
                }
                .padding(20)
                
                HStack {
                    
                    ForEach(0..<model.cards.count) { index in
                        CardView2(card: model.cards[index], hiddenCardIDs: $model.hiddenCardIDs)
                            .onTapGesture {
                                if !model.hiddenCardIDs.contains(model.cards[index].id) {
                                    model.selectedCardIndex = index
                                    model.hiddenCardIDs.insert(model.cards[index].id)
                                }
                            }
                    }
                }
                .padding(20)
                
                HStack {
                    ForEach(model.cardsToOrder.indices, id: \.self) { index in
                        CardsOrderView2(card: model.cardsToOrder[index])
                            .id(UUID())
                            .onTapGesture {
                                if let selectedToOrderIndex = model.selectedCardToOrderIndex {
                                    let selectedCardToOrder = model.cardsToOrder[selectedToOrderIndex]
                                    if selectedCardToOrder.text != "" {
                                        model.resetCardToOrderImage(at: selectedToOrderIndex)
                                    }
                                }
                                model.selectedCardToOrderIndex = index
                                let card = model.cardsToOrder[index]
                                //                                model.replaceCardImage()
                                model.replaceCardImage()
                                model.cardsToOrder = model.cardsToOrder
                            }
                        
                    }
                }
                
                        if model.allCardsPlaced {
                            
                            
                            Button {
                                //
                            } label: {
                                
                                ZStack{
                                    
                                    Rectangle()
                                        .foregroundColor(.blue)
                                        .frame(width: 150, height: 30)
                                    
                                    
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


struct Game2View_Previews: PreviewProvider {
    static var previews: some View {
        Game2View()
    }
}
