//
//  MemoryCardsGameView.swift
//  MelogranoProject
//
//  Created by Rita Marrano on 14/06/23.
//

import SwiftUI

struct MemoryCardsGameView: View {
    
    @StateObject  var game: GameMemoryModel
    @State var columns: [GridItem] = []
    
    
    @State var showPopup : Bool = false
    @State var showOpacity : Bool = false
    
    @Environment(\.presentationMode) var dismiss
    
    init(numberOfCards: Int) {
        _game = StateObject(wrappedValue: GameMemoryModel.withNumberOfCards(numberOfCards))
        
    }
    
    var body: some View {
        ZStack{
            VStack{
                VStack(alignment: .leading){
                    Text("MEMORY CARDS")
                        .font(.custom("Figtree-ExtraBold", size: dynamicWidth(34)))
                    
                    Text("Match the pairs of the same pictures.")
                        .font(.custom("Figtree-Regular", size: dynamicWidth(32)))
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal,dynamicWidth(60))
                .padding(.top, dynamicHeight(83))
                .ignoresSafeArea()

                if game.cards.count == 4 {
                    VStack{
                        LazyVGrid(columns: [GridItem(.flexible()),
                                            GridItem(.flexible())], spacing: 0) {
                            ForEach(game.cards.indices) { index in
                                
                                let card = game.cards[index]
                                let isFlipped = game.flippedCards.contains(index)
                                let isWrong = game.flippedWrongCards.contains(index)
                                let shouldReset = game.shouldResetCards && isWrong
                                
                                CardView(card: card, onCardTap: {
                                    game.choose(card)
                                })
                                .padding()
                                .rotation3DEffect(.degrees(isFlipped || shouldReset ? 180 : 0), axis: (x: 0, y: 1, z: 0))
                            }
                            
                        }
                                            .padding(.bottom, dynamicHeight(100))
                    }
                    

                }
                else if game.cards.count == 6
                {
                    VStack{
                        LazyVGrid(columns: [GridItem(.flexible()),
                                            GridItem(.flexible()),
                                            GridItem(.flexible())], spacing: 0) {
                            ForEach(game.cards.indices) { index in
                                
                                let card = game.cards[index]
                                let isFlipped = game.flippedCards.contains(index)
                                let isWrong = game.flippedWrongCards.contains(index)
                                let shouldReset = game.shouldResetCards && isWrong
                                
                                CardView(card: card, onCardTap: {
                                    game.choose(card)
                                })
                                .padding()
                                .rotation3DEffect(.degrees(isFlipped || shouldReset ? 180 : 0), axis: (x: 0, y: 1, z: 0))
                            }
                        }
                    }
                    .padding(.bottom, dynamicHeight(100))
                }
                else if game.cards.count == 8
                {
                    VStack{
                        LazyVGrid(columns: [GridItem(.flexible()),
                                            GridItem(.flexible()),
                                            GridItem(.flexible()),
                                            GridItem(.flexible())], spacing: 0) {
                            ForEach(game.cards.indices) { index in
                                
                                let card = game.cards[index]
                                let isFlipped = game.flippedCards.contains(index)
                                let isWrong = game.flippedWrongCards.contains(index)
                                let shouldReset = game.shouldResetCards && isWrong
                                
                                CardView(card: card, onCardTap: {
                                    game.choose(card)
                                })
                                .padding()
                                .rotation3DEffect(.degrees(isFlipped || shouldReset ? 180 : 0), axis: (x: 0, y: 1, z: 0))
                            }
                        }
                    }
                    .padding(.bottom, dynamicHeight(100))
                }
            }.navigationBarBackButtonHidden(game.isGameFinished)
                .onChange(of: game.isGameFinished, perform: {_ in
                    if game.isGameFinished{
                        withAnimation{
                            showOpacity = true
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            withAnimation(.linear(duration: 0.3)){
                                showPopup = true
                            }
                        }
                    }
                })
            
            if showOpacity {
                Color.black.opacity(0.8).ignoresSafeArea()
                if showPopup{
                    CongratsView(dismiss: {dismiss.wrappedValue.dismiss()}, replay: {
                        game.restartGame()
                        showOpacity = false
                        showPopup = false
                    }, points: 0, result:0,gameType: .memory)
                }
            }
        }
    }
}
