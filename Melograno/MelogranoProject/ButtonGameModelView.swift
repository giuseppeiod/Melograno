//
//  ButtonGameModelView.swift
//  MelogranoProject
//
//  Created by Rita Marrano on 30/05/23.
//


import SwiftUI

struct ButtonGameModelView: View {
    
    
    let game: Game
    
    var body: some View {
        
        ZStack {
            Image(game.image)
                .resizable()
                .background(Color.blue.opacity(0.7))
                .cornerRadius(40)
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.black, lineWidth: 3)
                ).shadow(color: Color.black.opacity(0.4), radius: 4, x: 0, y: 2)
            
            
            VStack {
                 
                Spacer()
                
                Text(game.title)
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(width: 225, height: 60)
                    .background(Color.clear.opacity(0.4))
                    .cornerRadius(59)
                    .overlay(
                        RoundedRectangle(cornerRadius: 59)
                            .stroke(Color.black, lineWidth: 2)
                        
                    )
            }
        }
        .frame(width: 230, height: 230)
    }
}


struct ButtonModelView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonGameModelView(game: Game(id: 1, title: "Game 1", image: ""))
    }
}
