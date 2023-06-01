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
            
            HStack(){
                
                    
                    Text("Welcome, Stefania!")
                        .font(.largeTitle)
                        .bold()
                    
                
            }
            
            NavigationView{
                
                
                HStack{
                    
                    NavigationLink(destination: GameOneView()){
                        ButtonGameModelView(game: Game(id: 1, title: "Game 1", image: "brain"))
                    }
                    
                    
                    
                    
                    NavigationLink(destination: GameTwoView()){
                        ButtonGameModelView(game: Game(id: 2, title: "Game 2", image: "brain"))
                    }
                    
                    
                    
                    NavigationLink(destination: CardMemoryGameView()){
                        ButtonGameModelView(game: Game(id: 3, title: "Game 3", image: "brain"))
                    }
                    
                    
                    
                    NavigationLink(destination: BallsGameMenuLevel()){
                        ButtonGameModelView(game: Game(id: 4, title: "Game 4", image: "brain"))
                    }
                }
                
            }.navigationViewStyle(StackNavigationViewStyle())
                .navigationBarBackButtonHidden(false)
        }
    }
}
struct StartMenu_Previews: PreviewProvider {
    static var previews: some View {
        StartMenu()
    }
}
