//
//  MenuPageC.swift
//  MelogranoProject
//
//  Created by Giuseppe Iodice on 15/05/23.
//


import SwiftUI

class GameSelection: ObservableObject {
    @Published var selectedGame: String?
}

struct ContentView1: View {
    @StateObject var gameSelection = GameSelection()

    var body: some View {
        switch gameSelection.selectedGame {
        case "Gioco 1":
            Game1View()
        case "Gioco 2":
            AMaronn()
        default:
            MenuPageC(gameSelection: gameSelection)
        }
    }
}

struct MenuPageC: View {
    @ObservedObject var gameSelection: GameSelection
    let games = ["Gioco 1", "Gioco 2"]

    var body: some View {
        VStack {
            Text("Benvenuto nel menu!")
                .font(.largeTitle)
                .padding()

            ForEach(games, id: \.self) { game in
                Button(action: {
                    self.gameSelection.selectedGame = game
                }) {
                    Text("Vai a \(game)")
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.bottom, 10)
            }
        }
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
//struct MenuPageC_Previews: PreviewProvider {
//   static var previews: some View {
//       MenuPageC()
//   }
// }
