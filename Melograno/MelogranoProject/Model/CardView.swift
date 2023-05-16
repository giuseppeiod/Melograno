//
//  CardView.swift
//  MelogranoProject
//
//  Created by Giuseppe Iodice on 16/05/23.
//

import SwiftUI

struct CardView: View {
    @ObservedObject var card: CardMemory
    var onCardTap: () -> Void

    var body: some View {
        ZStack {
            if card.isMatched {
                RoundedRectangle(cornerRadius: 6)
                    .fill(Color.green)
                    .frame(width: 200, height: 300)
            } else if card.isFaceUp {
                Image(card.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 300)
                    .cornerRadius(6)
            } else {
                RoundedRectangle(cornerRadius: 6)
                    .fill(Color.orange)
                    .frame(width: 200, height: 300)
                    .onTapGesture(perform: onCardTap)
            }
        }
    }
}


