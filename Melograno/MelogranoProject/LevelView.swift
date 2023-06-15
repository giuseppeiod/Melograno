//
//  LevelView.swift
//  MelogranoProject
//
//  Created by Rita Marrano on 12/06/23.
//

import SwiftUI

struct LevelView: View {
    var game : Game
    var body: some View {
        VStack(alignment: .center){
            Text(game.gameName)
                .font(.custom("Figtree-ExtraBold", size: dynamicWidth(48)))
                .padding(.bottom, dynamicWidth(93))
                .padding(.top, dynamicWidth(222))
            
            
            // .padding(.horizontal, dynamicWidth(.infinity))
            Text(game.gameDescription)
                .font(.custom("Figtree-Regular", size: dynamicWidth(36)))
                .multilineTextAlignment(.center)
                .padding(.bottom,dynamicWidth(100))
      
            HStack{
                ForEach(Level.allCases, id: \.self){level in
                    
                    NavigationLink(destination: ListGameView(game: game, level: level), label: {
                        FinishButtonView(buttonText: level.rawValue)
                    })
                }
            }
            
            Spacer()
      
        }
        .background(Image("levelbackground")
            .resizable()
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .scaledToFill())
       

        .ignoresSafeArea(.all)
    }
    
}

struct LevelView_Previews: PreviewProvider {
    static var previews: some View {
        LevelView(game:Game(gameName: "", gameDescription: "", gameImage: "", gameType: .association))
    }
}
