//
//  MenuPageC.swift
//  MelogranoProject
//
//  Created by Giuseppe Iodice on 15/05/23.
//



import SwiftUI
import AVFoundation
import UIKit

class GameSelection: ObservableObject {
    @Published var selectedGame: String?
}

struct ContentView1: View {
    @StateObject var gameSelection = GameSelection()

    
    var body: some View {
        switch gameSelection.selectedGame {
        case "Game 1":
            GameOneView()
        case "Game 2":
            GameTwoView()
        case "Game 3":
            CardMemoryGameView()
        case "Game 4":
            BallsGameMenuLevel()
        default:
            MenuPageC(gameSelection: gameSelection)
        }
    }
}

struct MenuPageC: View {
    
    @ObservedObject var gameSelection: GameSelection

    
    let games = [Game(id: 1, title: "Game 1", image: "brain"), Game(id: 2, title: "Game 2", image: "brain"), Game(id: 3, title: "Game 3", image: "brain"), Game(id: 4, title: "Game 4", image: "brain") ]
    
    // Aggiungi una variabile per il player audio
    @State private var audioPlayer: AVAudioPlayer?

    var body: some View {
        
        ZStack{
            
        VStack(alignment:.center) {
            
            
            HStack(){
                
                
                Text("Welcome!")
                    .font(.largeTitle)
                    .padding()
                
                Spacer()
            }.padding()
            
            Spacer()
            
            HStack(spacing: 25) {
                ForEach(games, id: \.self) { game in
                    
                    Button(action: {
                        withAnimation(.spring(response: 0.4)) {
                            self.gameSelection.selectedGame = game.title
                            
                            print("\(game)")

                        }
                        playSound() // Riproduci il suono al tap del pulsante
                    }) {
                        
                        
                        
                        ButtonGameModelView(game: game)
                        

                        
                    }
                    
                    .onTapGesture {
                        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
                        impactFeedbackgenerator.prepare()
                        impactFeedbackgenerator.impactOccurred()
                    }
                }
            }
            
            Spacer()
        }
        }
        .onAppear {
            setupAudioPlayer() // Configura il player audio
        }
    }

    // Funzione per configurare il player audio
    func setupAudioPlayer() {
        guard let soundURL = Bundle.main.url(forResource: "menu", withExtension: "mp3") else {
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.prepareToPlay()
        } catch {
            print("Errore nella configurazione del player audio: \(error.localizedDescription)")
        }
    }

    // Funzione per riprodurre il suono
    func playSound() {
        audioPlayer?.play()
    }
    

}



struct MenuPageC_Previews: PreviewProvider {
   static var previews: some View {
       ContentView1()
   }
}





