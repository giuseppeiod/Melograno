//
//  CardMemory.swift
//  MelogranoProject
//
//  Created by Giuseppe Iodice on 16/05/23.

import SwiftUI

struct CardMemoryGameView: View {
    @Environment(\.presentationMode) var dismiss

    var col = [GridItem(.flexible()),
                GridItem(.flexible())]

    @StateObject private var game: GameMemoryModel

    init(numberOfCards: Int) {
        _game = StateObject(wrappedValue: GameMemoryModel.withNumberOfCards(2))
    }

    var body: some View {
        
        
        ZStack{
            
            VStack() {
                
                
                
                HStack() {
                    Spacer()
                    Text("Match the cards")
                        .font(.custom("customRegular", size: 46))
                        .multilineTextAlignment(.center)
                        .bold()
                    
                    
                    Spacer()
                    
                }
                
                Spacer()
                
                ZStack{
                    LazyVGrid(columns: col, spacing: 0) {
                        ForEach(game.cards.indices) { index in
                            let card = game.cards[index]
                            let isFlipped = game.flippedCards.contains(index)
                            let isWrong = game.flippedWrongCards.contains(index)
                            let shouldReset = game.shouldResetCards && isWrong
                            
                            CardView(card: card, onCardTap: {
                                game.choose(card)
                                //                                flipCard(index)
                            })
                            
                            .padding()
                            
                            .rotation3DEffect(.degrees(isFlipped || shouldReset ? 180 : 0), axis: (x: 0, y: 1, z: 0))
                            .animation(.default)
                            .onTapGesture {
                                withAnimation {
                                    //                                    flipCard(index)
                                }
                            }
                        }
                    }
                    
                    
                }
                
                
                
            }
            if game.isGameFinished {
                
                
                CongratsView(dismiss: {dismiss.wrappedValue.dismiss()}, replay: {
                    game.resetGame()
                    
                }, points: 0, result:0 )
            }
            
        }
    }
}

struct CardMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        CardMemoryGameView(numberOfCards: 2)
    }
}
