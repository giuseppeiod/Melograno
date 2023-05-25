//
//  MenuPageC.swift
//  MelogranoProject
//
//  Created by Giuseppe Iodice on 15/05/23.
//


//import SwiftUI
//import AVFoundation
//
//class GameSelection: ObservableObject {
//    @Published var selectedGame: String?
//}
//
//struct ContentView1: View {
//    @StateObject var gameSelection = GameSelection()
//
//    var body: some View {
//        switch gameSelection.selectedGame {
//        case "Chronological Order \u{1F570}":
//            Game1View()
//        case "Images-Words Association \u{1F4F7}":
//            Game2View()
//        case "Memory Game \u{1F9E0}":
//            CardMemoryGameView()
//        case "Balls Game \u{1F534}":
//            BallsGameMenuLevel()
//        default:
//            MenuPageC(gameSelection: gameSelection)
//        }
//    }
//}
//
//struct MenuPageC: View {
//    @ObservedObject var gameSelection: GameSelection
//    let games = ["Chronological Order \u{1F570}", "Images-Words Association \u{1F4F7}", "Memory Game \u{1F9E0}", "Balls Game \u{1F534}"]
//
//    var body: some View {
//        VStack {
//            Text("Welcome!")
//                .font(.largeTitle)
//                .padding(50)
//            HStack{
//                ForEach(games, id: \.self) { game in
//                    Button(action: {
//                        withAnimation(.spring(response: 0.4)){
//                            self.gameSelection.selectedGame = game
//                        }
//                    }) {
//
//                        Text("Go to \(game)")
//                            .font(.title)
//                            .bold()
//                            .padding()
//                            .frame(width: 250, height: 220)
//                            .background(Color.purple.opacity(0.90))
//                            .foregroundColor(.white)
//                            .cornerRadius(26)
//
//                    }
//                    .padding(.bottom, 10)
//                }
//            }
//        }
//    }
//}
//struct Game1ViewC: View {
//    var body: some View {
//        Text("Sei ora nel Gioco 1!")
//            .font(.largeTitle)
//    }
//}
//
//struct Game2ViewC: View {
//    var body: some View {
//        Text("Sei ora nel Gioco 2!")
//            .font(.largeTitle)
//    }
//}
//struct Game3ViewC: View {
//    var body: some View {
//        Text("Sei ora nel Gioco 3!")
//            .font(.largeTitle)
//    }
//}
//struct MenuPageC_Previews: PreviewProvider {
//   static var previews: some View {
//       ContentView1()
//   }
//}

//import SwiftUI
//import AVFoundation
//import UIKit
//
//class GameSelection: ObservableObject {
//    @Published var selectedGame: String?
//}
//
//struct ContentView1: View {
//    @StateObject var gameSelection = GameSelection()
//
//    var body: some View {
//        switch gameSelection.selectedGame {
//        case "Chronological Order \u{1F570}":
//            Game1View()
//        case "Images-Words Association \u{1F4F7}":
//            Game2View()
//        case "Memory Game \u{1F9E0}":
//            CardMemoryGameView()
//        case "Balls Game \u{1F534}":
//            BallsGameMenuLevel()
//        default:
//            MenuPageC(gameSelection: gameSelection)
//        }
//    }
//}
//
//struct MenuPageC: View {
//    @ObservedObject var gameSelection: GameSelection
//    let games = ["Chronological Order \u{1F570}", "Images-Words Association \u{1F4F7}", "Memory Game \u{1F9E0}", "Balls Game \u{1F534}"]
//
//    var body: some View {
//        VStack {
//            Text("Welcome!")
//                .font(.largeTitle)
//                .padding(50)
//            HStack{
//                ForEach(games, id: \.self) { game in
//                    Button(action: {
//                        withAnimation(.spring(response: 0.4)){
//                            self.gameSelection.selectedGame = game
//                        }
//                    }) {
//                        Text("Go to \(game)")
//                            .font(.title)
//                            .bold()
//                            .padding()
//                            .frame(width: 260, height: 220)
//                            .background(Color.purple.opacity(0.90))
//                            .foregroundColor(.white)
//                            .cornerRadius(26)
//                    }
//                    .buttonStyle(BorderlessButtonStyle())
//                    .padding(10)
//                    .onTapGesture {
//                        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
//                        impactFeedbackgenerator.prepare()
//                        impactFeedbackgenerator.impactOccurred()
//                    }
//                }
//            }
//        }
//    }
//}
//
//struct Game1ViewC: View {
//    var body: some View {
//        Text("Sei ora nel Gioco 1!")
//            .font(.largeTitle)
//    }
//}
//
//struct Game2ViewC: View {
//    var body: some View {
//        Text("Sei ora nel Gioco 2!")
//            .font(.largeTitle)
//    }
//}
//
//struct Game3ViewC: View {
//    var body: some View {
//        Text("Sei ora nel Gioco 3!")
//            .font(.largeTitle)
//    }
//}
//
//struct MenuPageC_Previews: PreviewProvider {
//   static var previews: some View {
//       ContentView1()
//   }
//}

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
            Game1View()
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

    // Aggiungi una variabile per il player audio
    @State private var audioPlayer: AVAudioPlayer?

    var body: some View {
        VStack {
            Text("Welcome!")
                .font(.largeTitle)
                .padding(50)
            HStack {
                ForEach(games, id: \.self) { game in
                    Button(action: {
                        withAnimation(.spring(response: 0.4)) {
                            self.gameSelection.selectedGame = game
                        }
                        playSound() // Riproduci il suono al tap del pulsante
                    }) {
                        Text("Go to \(game)")
                            .font(.title)
                            .bold()
                            .padding()
                            .frame(width: 260, height: 220)
                            .background(Color.purple.opacity(0.90))
                            .foregroundColor(.white)
                            .cornerRadius(26)
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    .padding(10)
                    .onTapGesture {
                        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
                        impactFeedbackgenerator.prepare()
                        impactFeedbackgenerator.impactOccurred()
                    }
                }
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





