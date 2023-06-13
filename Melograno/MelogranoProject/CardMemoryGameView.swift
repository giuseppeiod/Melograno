//
//  CardMemory.swift
//  MelogranoProject
//
//  Created by Giuseppe Iodice on 16/05/23.

import SwiftUI

struct CardMemoryGameView: View {
    @Environment(\.presentationMode) var dismiss
    
    @State private var isGameFinishedButton = false
    @State private var flippedCards: [Int] = []
    @State private var flippedWrongCards: [Int] = []
    @State private var shouldResetCards = false

    var col = [GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible())]

    @StateObject private var game = GameMemoryModel()



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
                            let isFlipped = flippedCards.contains(index)
                            let isWrong = flippedWrongCards.contains(index)
                            let shouldReset = shouldResetCards && isWrong
                            
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

  
                Spacer()
            }
                if game.isGameFinished {

                                    CongratsView(dismiss: {dismiss.wrappedValue.dismiss()}, replay: {
                                        game.resetGame()

                                    }, points: 0, result:0 )
                                }
            
        }
//            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            }
    
func flipCard(_ index: Int) {
        withAnimation {
            if flippedCards.contains(index) {
                flippedCards.removeAll { $0 == index }
            } else {
                flippedCards.append(index)

                // Verifica il match delle carte
                if flippedCards.count == 2 {
                    let firstCardIndex = flippedCards[0]
                    let secondCardIndex = flippedCards[1]

                    if game.cards[firstCardIndex].id != game.cards[secondCardIndex].id {
                        flippedWrongCards.append(contentsOf: flippedCards)
                        shouldResetCards = true
                    }

                    flippedCards.removeAll()
                }
            }
        }
    }

    func restartGame() {
        game.resetGame()
        flippedCards.removeAll()
        flippedWrongCards.removeAll()
    }
}

struct CardMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        CardMemoryGameView()
    }
}
