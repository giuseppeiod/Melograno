//
//  CardMemory.swift
//  MelogranoProject
//
//  Created by Giuseppe Iodice on 16/05/23.
//

import SwiftUI

struct CardMemoryGameView: View {
    
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
        
        
        if isGameFinishedButton{
            ContentView()
        }else{
            ZStack{
                
                
                VStack(alignment: .center, spacing: 20){
                    
                    Text("Match the cards")
                        .font(.largeTitle)
                    
                    
                    NavBar()
                    
                    LazyVGrid(columns: col, spacing: 2){
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

    
    
    func restartGame() {
        game.resetGame()
        
    }
}

struct CardMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        CardMemoryGameView()
    }
}
