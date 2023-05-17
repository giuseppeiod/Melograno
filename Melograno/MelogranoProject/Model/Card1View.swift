//
//  Card1View.swift
//  MelogranoProject
//
//  Created by Rita Marrano on 17/05/23.
//


import SwiftUI

struct Card1View: View {
    let card: Card1
    
    var body: some View {
        Image(card.imageName)
            .resizable()
            .frame(width: 100, height: 100)
            .background(Color.green)
            .cornerRadius(16)
    }
}


struct Card1View_Previews: PreviewProvider {
    static var previews: some View {
        Card1View(card: Card1(correctIndex: "1", imageName: "uno") )
    }
}
