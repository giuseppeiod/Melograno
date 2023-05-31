
import SwiftUI
import AVFoundation

class BallsGameLevelSelection: ObservableObject {
    @Published var selectedGame: String?
    private var audioPlayer: AVAudioPlayer?
    
    init() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
        } catch {
            print("Failed to set audio session category: \(error)")
        }
    }
    
    func playTapSound() {
        guard let soundURL = Bundle.main.url(forResource: "menu", withExtension: "mp3") else {
            print("Failed to find tap sound file")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.play()
        } catch {
            print("Failed to play tap sound: \(error)")
        }
    }
}

struct BallsGameMenuLevel: View {
    @StateObject var gameSelection = BallsGameLevelSelection()
    
    var body: some View {
        switch gameSelection.selectedGame {
        case "Level 1":
            ContentViewBallsLevel1()
        case "Level 2":
            ContentViewBallsLevel2()
        case "Level 3":
            ContentViewBallsLevel3()
        default:
            BallsGameMenuLevelModel(gameSelection: gameSelection)
        }
    }
}

struct BallsGameMenuLevelModel: View {
    @ObservedObject var gameSelection: BallsGameLevelSelection
    
    @State private var turnBack = false
    
    let games = ["Level 1", "Level 2", "Level 3"]
    var buttonImagesGame: [String] = ["level1", "level2", "level3", "level4"]
    
    var body: some View {
        if turnBack {
            ContentView1()
        } else {
            VStack {
                HStack {
                    Button(action: {
                        turnBack = true
                        print("Back button pressed")
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title)
                            .foregroundColor(.gray)
                        Text("Back")
                            .font(.headline)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .padding(30)
                
                Text("BALLSATHLON")
                    .font(.system(size: 80))
                    .padding()
                
                Text("The balls will light up. Remember the longest sequence of colors possible!")
                    .font(.largeTitle)
                    .padding()
                
                Spacer()
                
                HStack(spacing: 90) {
                    ForEach(games.indices, id: \.self) { game in
                        Button(action: {
                            self.gameSelection.selectedGame = games[game]
                            self.gameSelection.playTapSound()
                        }) {
                            Image(buttonImagesGame[game])
                        }
                        .padding(.bottom, 10)
                    }
                }
                
                Spacer()
            }
        }
    }
}

struct BallsGameMenuLevel_Previews: PreviewProvider {
    static var previews: some View {
        BallsGameMenuLevel()
    }
}
