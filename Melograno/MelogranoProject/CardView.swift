//
//  CardView.swift
//  MelogranoProject
//
//  Created by Giuseppe Iodice on 16/05/23.
//

import SwiftUI

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct CardView: View {

    @ObservedObject var card: CardMemory
    var onCardTap: () -> Void

    var body: some View {
        ZStack {
            if card.isMatched {
                Image(card.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:200, height: 250)
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
                                    .frame(width: 200, height: 280) // Imposta le dimensioni dell'immagine di sfondo
                            )
                
            } else if card.isFaceUp {
                Image(card.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 250)
                    .cornerRadius(30)
                    .background(
                                Image("sfondo")
                                    .resizable() // Rendi l'immagine di sfondo ridimensionabile
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 200, height: 280) // Imposta le dimensioni dell'immagine di sfondo
                            )
            } else {
                RoundedRectangle(cornerRadius: 30)
                    .fill(
                        ImagePaint(image: Image("retrocarta"))
                    )
                    .frame(width: 200, height: 280)
                    .onTapGesture(perform: onCardTap)
            }
        }
    }
}


