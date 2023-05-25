//
//  CardMemory.swift
//  MelogranoProject
//
//  Created by Giuseppe Iodice on 16/05/23.

import SwiftUI

struct CardMemoryGameView: View {

    @State private var isGameFinishedButton = false
    @State private var flippedCards: [Int] = []
    @State private var flippedWrongCards: [Int] = []
    @State private var shouldResetCards = false

    var col = [GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible())]

    @StateObject private var game = GameMemoryModel()

    var progress: CGFloat {
        return game.progress
    }

    var body: some View {
        if isGameFinishedButton {
            ContentView()
        } else {
            ZStack {
                VStack(alignment: .center, spacing: 20) {
                    Text("Match the cards")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)

                    NavBar()
                    Spacer()

                    LazyVGrid(columns: col, spacing: 2) {
                        ForEach(game.cards.indices) { index in
                            let card = game.cards[index]
                            let isFlipped = flippedCards.contains(index)
                            let isWrong = flippedWrongCards.contains(index)
                            let shouldReset = shouldResetCards && isWrong

                            CardView(card: card, onCardTap: {
                                game.choose(card)
                                flipCard(index)
                            })
                            
                            .padding()
                            
                            .rotation3DEffect(.degrees(isFlipped || shouldReset ? 180 : 0), axis: (x: 0, y: 1, z: 0))
                            .animation(.easeInOut(duration: 0.5))
                            .onTapGesture {
                                withAnimation {
                                    flipCard(index)
                                }
                            }
                        }
                    }

                    if game.isGameFinished {
                        Spacer()
                        Text("Congratulations! You matched all the cards!")
                            .font(.custom("Arial", size: 30))
                                .foregroundColor(.green)
                        Button(action: {
                            restartGame()
                        }, label: {
                            Text("Restart Game")
                                .font(.custom("Arial", size: 30))
                                .foregroundColor(.white)
                                .padding(10)
                                .background(Color.blue)
                                .cornerRadius(10)
                        })
                    }

                    Spacer()
                }
            }
            .onChange(of: shouldResetCards) { shouldReset in
                if shouldReset {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        flippedWrongCards.removeAll()
                        shouldResetCards = false
                    }
                }
            }
        }
    }

    @ViewBuilder
    func NavBar() -> some View {
        HStack(spacing: 18) {
            Button(action: {
                isGameFinishedButton = true
                print("Button pressed")
            }) {
                Image(systemName: "xmark")
                    .font(.title)
                    .foregroundColor(.gray)
            }

            GeometryReader { proxy in
                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(.green.opacity(0.25))

                    Capsule()
                        .fill(.gray.opacity(0.25))
                        .frame(width: proxy.size.width * progress)
                }
            }
            .frame(width: 730, height: 40)

            Button {
                // Handle button action here
            } label: {
                Image(systemName: "suit.heart.fill")
                    .font(.title)
                    .foregroundColor(.red)
            }
        }
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

//----------------------------
//import SwiftUI
//
//struct CardMemoryGameView: View {
//
//    @State private var isGameFinishedButton = false
//    @State private var flippedCards: [Int] = []
//
//    var col = [GridItem(.flexible()),
//                GridItem(.flexible()),
//                GridItem(.flexible())]
//
//    @StateObject private var game = GameMemoryModel()
//
//    var progress: CGFloat {
//        return game.progress
//    }
//
//    var body: some View {
//        if isGameFinishedButton {
//            ContentView()
//        } else {
//            ZStack {
//                VStack(alignment: .center, spacing: 20) {
//                    Text("Match the cards")
//                        .font(.largeTitle)
//                        .fontWeight(.bold)
//                        .multilineTextAlignment(.center)
//
//                    NavBar()
//                    Spacer()
//
//                    LazyVGrid(columns: col, spacing: 2) {
//                        ForEach(game.cards.indices) { index in
//                            let card = game.cards[index]
//                            let isFlipped = flippedCards.contains(index)
//
//                            CardView(card: card, onCardTap: {
//                                game.choose(card)
//                                flipCard(index)
//                            })
//                            .rotation3DEffect(.degrees(isFlipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
//                            .animation(.easeInOut(duration: 0.5))
//                            .onTapGesture {
//                                withAnimation {
//                                    flipCard(index)
//                                }
//                            }
//                        }
//                    }
//
//                    if game.isGameFinished {
//                        Text("Congratulations! You matched all the cards!")
//                            .font(.headline)
//                            .foregroundColor(.green)
//
//                        Button(action: {
//                            restartGame()
//                        }, label: {
//                            Text("Restart Game")
//                                .font(.headline)
//                                .foregroundColor(.white)
//                                .padding()
//                                .background(Color.blue)
//                                .cornerRadius(10)
//                        })
//                    }
//
//                    Spacer()
//                }
//            }
//        }
//    }
//
//    @ViewBuilder
//    func NavBar() -> some View {
//        HStack(spacing: 18) {
//            Button(action: {
//                isGameFinishedButton = true
//                print("Button pressed")
//            }) {
//                Image(systemName: "xmark")
//                    .font(.title)
//                    .foregroundColor(.gray)
//            }
//
//            GeometryReader { proxy in
//                ZStack(alignment: .leading) {
//                    Capsule()
//                        .fill(.gray.opacity(0.25))
//
//                    Capsule()
//                        .fill(.green.opacity(0.25))
//                        .frame(width: proxy.size.width * progress)
//                }
//            }
//            .frame(width: 730, height: 40)
//
//            Button {
//                // Handle button action here
//            } label: {
//                Image(systemName: "suit.heart.fill")
//                    .font(.title)
//                    .foregroundColor(.red)
//            }
//        }
//    }
//
//    func flipCard(_ index: Int) {
//        withAnimation {
//            if flippedCards.contains(index) {
//                flippedCards.removeAll { $0 == index }
//            } else {
//                flippedCards.append(index)
//            }
//        }
//    }
//
//    func restartGame() {
//        game.resetGame()
//        flippedCards.removeAll()
//    }
//}
//
//struct CardMemoryGameView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardMemoryGameView()
//    }
//}

