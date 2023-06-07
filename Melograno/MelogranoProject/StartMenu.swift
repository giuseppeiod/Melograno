//
//  StartMenu.swift
//  MelogranoProject
//
//  Created by Rita Marrano on 01/06/23.
//

import SwiftUI
import AVFoundation

struct StartMenu: View {
    @State private var audioPlayer: AVAudioPlayer?
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "menu", withExtension: "mp3") else { return }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Errore nella riproduzione del suono: \(error.localizedDescription)")
        }
    }
    
    var body: some View {
        ZStack{
            
                Image("Menu")
                    .resizable()
                    .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            VStack(alignment: .center) {
                Text("Welcome !")
                  
                    .font(.system(size: 80))
                    .font(.custom("Figtree-ExtraBold", size: 46))
                                                        .fontWeight(.semibold)
                                                        .padding([.top, .leading], 40.0)
                
                
                HStack(spacing: 45) {
                    NavigationLink(destination: GameOneView()) {
                        ButtonGameModelView(game: Game(id: 1, title: "TIME ORDER", image: "cop1"))
                    }
                    .simultaneousGesture(
                        TapGesture().onEnded {
                            playSound()
                        }
                    )
                    
                    NavigationLink(destination: GameTwoView()) {
                        ButtonGameModelView(game: Game(id: 2, title: "IMAGE-WORD", image: "cop2"))
                    }
                    .simultaneousGesture(
                        TapGesture().onEnded {
                            playSound()
                        }
                    )
                    
                    NavigationLink(destination: CardMemoryGameView()) {
                        ButtonGameModelView(game: Game(id: 3, title: "MEMORY", image: "cop3"))
                    }
                    .simultaneousGesture(
                        TapGesture().onEnded {
                            playSound()
                        }
                    )
                    
                    NavigationLink(destination: BallsGameMenuLevel()) {
                        ButtonGameModelView(game: Game(id: 4, title: "BALLSATHLON", image: "cop4"))
                    }
                    .simultaneousGesture(
                        TapGesture().onEnded {
                            playSound()
                        }
                    )
                }
            }
            .padding(.bottom, 100)
            .navigationBarHidden(true)
   
        }
    }
    
}

struct StartMenu_Previews: PreviewProvider {
    static var previews: some View {
        StartMenu()
    }
}//
//import SwiftUI
//import AVFoundation
//
//struct StartMenu: View {
//    @State private var audioPlayer: AVAudioPlayer?
//
//    func playSound() {
//        guard let url = Bundle.main.url(forResource: "menu", withExtension: "mp3") else { return }
//        do {
//            audioPlayer = try AVAudioPlayer(contentsOf: url)
//            audioPlayer?.play()
//        } catch {
//            print("Errore nella riproduzione del suono: \(error.localizedDescription)")
//        }
//    }
//
//
//
//    var body: some View {
//
//
//
//
//
//                VStack(alignment: .center){
//
//
//
//                    if let userName = UserDefaults.standard.string(forKey: "userName") {
//
//
//                        Text("Welcome, \(userName)!")
//                        .font(.custom("customRegular", size: 46))
//                            .bold()
//                    } else {
//                        // Nessun nome salvato
//                    }
//
//
//
//                    HStack(spacing: 15){
//
//                    NavigationLink(destination: GameOneView()){
//                        ButtonGameModelView(game: Game(id: 1, title: "TIME ORDER", image: "cop1"))
//                    }
//                    .simultaneousGesture(
//                        TapGesture().onEnded {
//                            playSound()
//                        }
//                    )
//
//
//
//
//                    NavigationLink(destination: GameTwoView()){
//                        ButtonGameModelView(game: Game(id: 2, title: "IMAGE-WORD", image: "cop2"))
//                    }
//                    .simultaneousGesture(
//                        TapGesture().onEnded {
//                            playSound()
//                        }
//                    )
//
//
//                    NavigationLink(destination: CardMemoryGameView()){
//                        ButtonGameModelView(game: Game(id: 3, title: "MEMORY", image: "cop3"))
//                    }
//                    .simultaneousGesture(
//                        TapGesture().onEnded {
//                            playSound()
//                        }
//                    )
//
//
//                    NavigationLink(destination: BallsGameMenuLevel()){
//                        ButtonGameModelView(game: Game(id: 4, title: "BALLSATHLON", image: "cop4"))
//                    }
//                    .simultaneousGesture(
//                        TapGesture().onEnded {
//                            playSound()
//                        }
//                    )
//                }
//
//            }
//
//
//    }
//
//}
//struct StartMenu_Previews: PreviewProvider {
//    static var previews: some View {
//        StartMenu()
//    }
//}
