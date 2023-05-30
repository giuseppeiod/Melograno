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
        case "Chronological Order \u{1F570}":
            GameOneView()
        case "Images-Words Association \u{1F4F7}":
            Game2View()
        case "Memory Game \u{1F9E0}":
            CardMemoryGameView()
        case "Balls Game \u{1F534}":
            BallsGameMenuLevel()
        default:
            MenuPageC(gameSelection: gameSelection)
        }
    }
}

struct MenuPageC: View {
    @ObservedObject var gameSelection: GameSelection
    let games = ["Chronological Order \u{1F570}", "Images-Words Association \u{1F4F7}", "Memory Game \u{1F9E0}", "Balls Game \u{1F534}"]
    var buttonImagesGame: [String] = ["buttonGame1", "buttonGame2", "buttonGame3", "buttonGame4" ]
    

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
                ForEach(games.indices, id: \.self) { game in
                    
                    Button(action: {
                        withAnimation(.spring(response: 0.4)) {
                            self.gameSelection.selectedGame = games[game]
                            print("\(game)")
                            print("\(buttonImagesGame[game])")
                        }
                        playSound() // Riproduci il suono al tap del pulsante
                    }) {
                        
                        
                        
                        Image(buttonImagesGame[game])
                        
                        
                        //                            RoundedRectangle(cornerRadius: 16)
                        //                                .fill(Color.purple.opacity(0.7))
                        //                                .overlay(
                        //                                    RoundedRectangle(cornerRadius: 16)
                        //                                        .stroke(Color.black, lineWidth: 2)
                        //                                )
                        //                                .frame(width: 230, height: 220)
                        //
                        //
                        //                            RoundedRectangle(cornerRadius: 16)
                        //                                .fill(Color.purple.opacity(0.9))
                        //                                .overlay(
                        //                                    RoundedRectangle(cornerRadius: 16)
                        //                                        .stroke(Color.black, lineWidth: 2)
                        //                                )
                        //                                .frame(width: 230, height: 100)
                        
                        //                            Text("Go to \(game)")
                        //                                .multilineTextAlignment(.center)
                        //                                .font(.title)
                        //                                .bold()
                        //                                .foregroundColor(.black)
                        //                                .frame(width: 200, height: 200)
                        
                        
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
        }.background(.brown.opacity(0.6))
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

struct Game1ViewC: View {
    var body: some View {
        Text("Sei ora nel Gioco 1!")
            .font(.largeTitle)
    }
}

struct Game2ViewC: View {
    var body: some View {
        Text("Sei ora nel Gioco 2!")
            .font(.largeTitle)
    }
}

struct Game3ViewC: View {
    var body: some View {
        Text("Sei ora nel Gioco 3!")
            .font(.largeTitle)
    }
}

struct MenuPageC_Previews: PreviewProvider {
   static var previews: some View {
       ContentView1()
   }
}





