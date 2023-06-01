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
                        .font(.system(size: 33))
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


//import SwiftUI
//
//struct ButtonGameModelView: View {
//
//
//    let game: Game
//
//    var body: some View {
//
//        ZStack {
//            Image(game.image)
//                .resizable()
//                .background(Color.blue.opacity(0.7))
//                .cornerRadius(40)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 40)
//                        .stroke(Color.black, lineWidth: 3)
//                ).shadow(color: Color.black.opacity(0.4), radius: 4, x: 0, y: 2)
//
//
//            VStack {
//
//                Spacer()
//
//                Text(game.title)
//                    .font(.title)
//                    .foregroundColor(.white)
//                    .frame(width: 225, height: 60)
//                    .background(Color.clear.opacity(0.4))
//                    .cornerRadius(59)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 59)
//                            .stroke(Color.black, lineWidth: 2)
//
//                    )
//            }
//        }
//        .frame(width: 230, height: 230)
//    }
//}
//
//
//struct ButtonModelView_Previews: PreviewProvider {
//    static var previews: some View {
//        ButtonGameModelView(game: Game(id: 1, title: "Game 1", image: ""))
//    }
//}
