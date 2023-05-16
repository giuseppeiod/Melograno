//
//  CardMemory.swift
//  MelogranoProject
//
//  Created by Giuseppe Iodice on 16/05/23.
//

import SwiftUI
struct CardsMemoryGameView: View {
    
    @State private var isGameFinishedButton = false

    
    var col = [ GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible()),

    ]
    
    var row = [ GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible()),

    ]
    
    @StateObject private var game = GameMemoryModel()
//    @State var cards = createCardList(dim: 3).shuffled()

    
    var progress: CGFloat {
        return game.progress
    }
    var body: some View {
        
        ZStack{
            VStack(alignment: .center){
                
                Text("Match the cards")
                    .font(.largeTitle)
                
                
                NavBar()
                
                LazyVGrid(columns: col, spacing: 3){
                    ForEach(game.cards){ card in
                        
                        CardView(card: card, onCardTap: {
                            
                            game.choose(card)
                            
                        })
                        
                        
                        
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

            }
            
//            if game.isGameFinished {
//                Text("Congratulations! You matched all the cards!")
//                    .font(.headline)
//                    .foregroundColor(.green)
//
//                Button(action: {
//                    restartGame()
//                }, label: {
//                    Text("Restart Game")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .padding()
//                        .background(Color.blue)
//                        .cornerRadius(10)
//                })
//            }
            
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
            .frame(height: 40)
            
            Button {
                // Handle button action here
            } label: {
                Image(systemName: "suit.heart.fill")
                    .font(.title)
                    .foregroundColor(.red)
            }
        }
    }

    
    
    func restartGame() {
        game.resetGame()
        
    }
}

struct CardsMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        CardsMemoryGameView()
    }
}


