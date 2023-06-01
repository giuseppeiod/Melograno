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
    
    var altezza : CGFloat = UIScreen.main.bounds.height * 0.35
    var larghezza : CGFloat = UIScreen.main.bounds.width * 0.15
    
    var body: some View {
        ZStack {
            if card.isMatched {
                Image(card.imageName)
                    .resizable()
                    .frame(height: altezza*0.7)
                    .scaledToFit()
                    .overlay(
                        Image(systemName: "checkmark")
                            .font(.system(size: 100))
                            .foregroundColor(.green)
                    )
                    .cornerRadius(30)
                    .background(
                        Image("sfondo")
                            .resizable() // Rendi l'immagine di sfondo ridimensionabile
                            .aspectRatio(contentMode: .fill)
                            .frame(width: larghezza, height: altezza) // Imposta le dimensioni dell'immagine di sfondo
                    )
                
            } else if card.isFaceUp {
                Image(card.imageName)
                    .resizable()
                    .frame( height: altezza*0.7)
                    .scaledToFit()
                    .background(
                        Image("sfondo")
                            .resizable() // Rendi l'immagine di sfondo ridimensionabile
                            .aspectRatio(contentMode: .fill)
                            .frame(width: larghezza, height: altezza) // Imposta le dimensioni dell'immagine di sfondo
                    )
            } else {
                RoundedRectangle(cornerRadius: 30)
                    .fill(
                        ImagePaint(image: Image("retrocarta"))
                    )
                    .frame(width: larghezza, height: altezza)
                    .onTapGesture(perform: onCardTap)
            }
        }
        .frame(width: larghezza, height: altezza)
    }
}


