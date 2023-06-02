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
        ZStack{
            Image(game.image)
                .resizable()
                .scaledToFill()
            VStack{
                Spacer()
                ZStack{
                    Text(game.title)
                        .font(.custom("customRegular", size: 46))
                        .foregroundColor(.black)
                        .frame(width: UIScreen.main.bounds.width*0.8, height: UIScreen.main.bounds.height*0.07)
//                        .background(
//                            LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .top, endPoint: .bottom))
                        .background(Color.white.opacity(0.9))
                }
            }
            .frame(width: UIScreen.main.bounds.width*0.2 , height: UIScreen.main.bounds.width*0.2)
        }
        .frame(width: UIScreen.main.bounds.width*0.2 , height: UIScreen.main.bounds.width*0.2)
        .cornerRadius(16)
    }
}
struct ButtonModelView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonGameModelView(game: Game(id: 1, title: "Game 1", image: ""))
    }
}

