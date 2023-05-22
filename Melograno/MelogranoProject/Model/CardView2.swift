//
//  CardView2.swift
//  MelogranoProject
//
//  Created by Giuseppe Iodice on 22/05/23.
//

import SwiftUI

struct CardView2: View {
    @State var card: Card2
    @Binding var hiddenCardIDs: Set<Int>
    
    var isHidden: Bool {
        hiddenCardIDs.contains(card.id)
    }
    
    var body: some View {
        if !isHidden {
            Image(card.imageName)
                .resizable()
                .frame(width: 100, height: 100)
                .background(Color.green)
                .cornerRadius(10)
        } else {
            Image("")
                .resizable()
                .frame(width: 100, height: 100)
                .background(Color.green)
                .cornerRadius(10)
        }
    }
}

