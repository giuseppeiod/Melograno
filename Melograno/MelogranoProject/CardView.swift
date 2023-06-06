//
//  CardView.swift
//  MelogranoProject
//
//  Created by Giuseppe Iodice on 16/05/23.
//

import SwiftUI

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: CardMemory(imageName: "albero"), onCardTap: {} )
    }
}
struct CardView: View {
    @ObservedObject var card: CardMemory
    var onCardTap: () -> Void
    
    var altezza: CGFloat = UIScreen.main.bounds.height * 0.35
    var larghezza: CGFloat = UIScreen.main.bounds.width * 0.15
    
    var body: some View {
        ZStack {
            if card.isMatched {
                Image(card.imageName)
                    .resizable()
                    .scaledToFit()
                    .overlay(
                        Image(systemName: "checkmark")
                            .font(.system(size: 100))
                            .foregroundColor(.green)
                    )
                    .cornerRadius(30)
                    .background(
                        Image("sfondo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: larghezza, height: altezza)
                    )
                    .rotation3DEffect(.degrees(0), axis: (x: 0, y: 1, z: 0))
            } else if card.isFaceUp {
                Image(card.imageName)
                    .resizable()
                    .scaledToFit()
                    .background(
                        Image("sfondo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: larghezza, height: altezza)
                    )
                    .rotation3DEffect(.degrees(0), axis: (x: 0, y: 1, z: 0))
            } else {
                Image("retrocardmemory")
                    .resizable()
                    .scaledToFit()
                    .frame(width: larghezza, height: altezza)
                    .rotation3DEffect(.degrees(0), axis: (x: 0, y: 1, z: 0))
                    .onTapGesture(perform: onCardTap)
            }
        }
        .frame(width: larghezza, height: altezza)
        .rotation3DEffect(.degrees(card.isFaceUp ? 180 : 0), axis: (x: 0, y: 1, z: 0))
//        .animation(.easeInOut(duration: 0.5))
    }
}
