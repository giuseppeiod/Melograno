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
    
    var altezza: CGFloat = dynamicHeight(296)
    var larghezza: CGFloat = dynamicWidth(206)
    
    var body: some View {
        ZStack {
            if card.isMatched {
                ZStack{
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: larghezza, height: altezza)
                    Image(card.imageName)
                        .resizable()
                        .frame(width: larghezza, height: altezza)
                        .scaledToFit()
                        .overlay(
                            Image(systemName: "checkmark")
                                .font(.system(size: 100))
                                .foregroundColor(.green)
                        )
                        .rotation3DEffect(.degrees(0), axis: (x: 0, y: 1, z: 0))
                }
                .frame(width: larghezza, height: altezza)
                .overlay(
                    RoundedRectangle(cornerRadius: dynamicWidth(30))
                        .stroke(Color("violaApp"), lineWidth: 5))
            } else if card.isFaceUp {
                ZStack{
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: larghezza, height: altezza)
                    Image(card.imageName)
                        .resizable()
                        .frame(width: larghezza, height: altezza)
                        .scaledToFit()
                        .rotation3DEffect(.degrees(0), axis: (x: 0, y: 1, z: 0))
                }
                .frame(width: larghezza, height: altezza)
                .overlay(
                    RoundedRectangle(cornerRadius: dynamicWidth(30))
                        .stroke(Color("violaApp"), lineWidth: 5))
            } else {
                Image("retrocardmemory")
                    .resizable()
                    .frame(width: larghezza, height: altezza)
                    .scaledToFit()
                   
                    .rotation3DEffect(.degrees(0), axis: (x: 0, y: 1, z: 0))
                    .onTapGesture(perform: onCardTap)
            }
        }
        .frame(width: larghezza, height: altezza)
        .rotation3DEffect(.degrees(card.isFaceUp ? 180 : 0), axis: (x: 0, y: 1, z: 0))
        .animation(.easeInOut(duration: 0.5))
    }
}
