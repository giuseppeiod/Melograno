//
//  CardMemory.swift
//  MelogranoProject
//
//  Created by Giuseppe Iodice on 16/05/23.
//

import SwiftUI

struct CardMemoryGameView: View {

    @State private var isGameFinishedButton = false
    @State private var flippedCardIndex: Int?

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
                            let isFlipped = flippedCardIndex == index

                            CardView(card: card, onCardTap: {
                                game.choose(card)
                                flipCard(index)
                            })
                            .rotation3DEffect(.degrees(isFlipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
                            .animation(.easeInOut(duration: 0.5))
                            .onTapGesture {
                                withAnimation {
                                    flipCard(index)
                                }
                            }
                        }
                    }

                    if game.isGameFinished {
                        Text("Congratulations! You matched all the cards!")
                            .font(.headline)
                            .foregroundColor(.green)

                        Button(action: {
                            restartGame()
                        }, label: {
                            Text("Restart Game")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(10)
                        })
                    }

                    Spacer()
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
                        .fill(.gray.opacity(0.25))

                    Capsule()
                        .fill(.green.opacity(0.25))
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
            if flippedCardIndex == index {
                flippedCardIndex = nil
            } else {
                flippedCardIndex = index
            }
        }
    }

    func restartGame() {
        game.resetGame()
    }
}

struct CardMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        CardMemoryGameView()
    }
}
