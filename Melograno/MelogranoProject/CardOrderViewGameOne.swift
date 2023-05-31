//
//  CardOrderViewGameOne.swift
//  MelogranoProject
//
//  Created by Rita Marrano on 30/05/23.
//

import SwiftUI

struct CardOrderViewGameOne: View {
    
    @State var card: CardGameOne
    
    var body: some View {
        

        Image(card.imageName)
            .resizable()
            .frame(width: 200, height: 200)
            .background(Color.white)
            .cornerRadius(16).overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.purple, lineWidth: 2)
            ).shadow(color: Color.black.opacity(0.4), radius: 4, x: 0, y: 2)
               
                

        }
    }


