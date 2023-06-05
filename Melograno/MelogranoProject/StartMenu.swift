//
//  StartMenu.swift
//  MelogranoProject
//
//  Created by Rita Marrano on 01/06/23.
//

import SwiftUI

struct StartMenu: View {
    
    
    
    var body: some View {
        
        

                
                
                VStack(alignment: .center){
                    
                        

                    if let userName = UserDefaults.standard.string(forKey: "userName") {
                   
                        
                        Text("Welcome, \(userName)!")
                        .font(.custom("customRegular", size: 46))
                            .bold()
                    } else {
                        // Nessun nome salvato
                    }
                    
                
                
                    HStack(spacing: 15){
                    
                    NavigationLink(destination: GameOneView()){
                        ButtonGameModelView(game: Game(id: 1, title: "TIME ORDER", image: "cop1"))
                    }
                    
                    
                    
                    
                    NavigationLink(destination: GameTwoView()){
                        ButtonGameModelView(game: Game(id: 2, title: "IMAGE-WORD", image: "cop2"))
                    }
                    
                    
                    
                    NavigationLink(destination: CardMemoryGameView()){
                        ButtonGameModelView(game: Game(id: 3, title: "MEMORY", image: "cop3"))
                    }
                    
                    
                    
                    NavigationLink(destination: BallsGameMenuLevel()){
                        ButtonGameModelView(game: Game(id: 4, title: "BALLSATHLON", image: "cop4"))
                    }
                }
                
            }


    }
}
struct StartMenu_Previews: PreviewProvider {
    static var previews: some View {
        StartMenu()
    }
}
