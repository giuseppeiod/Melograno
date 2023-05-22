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
                
                
                HStack {
                    ForEach(model.cards, id: \.id) { card in
                        CardView2(card: card, hiddenCardIDs: $model.hiddenCardIDs)
                            .onTapGesture {
                                if !model.hiddenCardIDs.contains(card.id) {
                                    model.selectedCardIndex = card.id
                                    model.hiddenCardIDs.insert(card.id)
                                }
                            }
                    }
                }
                
                
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
                                
                                model.replaceCardImage()
                                model.cardsToOrder = model.cardsToOrder
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
}


struct Game2View_Previews: PreviewProvider {
    static var previews: some View {
        Game2View()
    }
}
