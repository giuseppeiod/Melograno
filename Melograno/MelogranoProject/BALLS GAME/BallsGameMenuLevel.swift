
import SwiftUI
import AVFoundation

////class BallsGameLevelSelection: ObservableObject {
////    @Published var selectedGame: String?
////    private var audioPlayer: AVAudioPlayer?
////
////    init() {
////        do {
////            try AVAudioSession.sharedInstance().setCategory(.playback)
////        } catch {
////            print("Failed to set audio session category: \(error)")
////        }
////    }
////
////    func playTapSound() {
////        guard let soundURL = Bundle.main.url(forResource: "menu", withExtension: "mp3") else {
////            print("Failed to find tap sound file")
////            return
////        }
////
////        do {
////            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
////            audioPlayer?.play()
////        } catch {
////            print("Failed to play tap sound: \(error)")
////        }
////    }
////}
////
////struct BallsGameMenuLevel: View {
////    @StateObject var gameSelection = BallsGameLevelSelection()
////
////    var body: some View {
////        switch gameSelection.selectedGame {
////        case "Level 1":
////            ContentViewBallsLevel1()
////        case "Level 2":
////            ContentViewBallsLevel2()
////        case "Level 3":
////            ContentViewBallsLevel3()
////        default:
////            BallsGameMenuLevelModel(gameSelection: gameSelection)
////        }
////    }
////}
////
////struct BallsGameMenuLevelModel: View {
////    @ObservedObject var gameSelection: BallsGameLevelSelection
////
////    @State private var turnBack = false
////
////    let games = ["Level 1", "Level 2", "Level 3"]
////    var buttonImagesGame: [String] = ["level1", "level2", "level3", "level4"]
////
////    var body: some View {
////
////            VStack {
////
////
////                Text("BALLSATHLON")
////                    .font(.system(size: 80))
////                    .padding()
////
////                Text("The balls will light up. Remember the longest sequence of colors possible!")
////                    .font(.largeTitle)
////                    .padding()
////
////                Spacer()
////
////                HStack(spacing: 90) {
////                    ForEach(games.indices, id: \.self) { game in
////                        Button(action: {
////                            self.gameSelection.selectedGame = games[game]
////                            self.gameSelection.playTapSound()
////                        }) {
////                            Image(buttonImagesGame[game])
////                        }
////                        .padding(.bottom, 10)
////                    }
////                }
////
////                Spacer()
////            }
////
////    }
////}
//
//
////struct BallsGameMenuLevel: View{
////    @State private var audioPlayer: AVAudioPlayer?
////    func playSound() {
////        guard let url = Bundle.main.url(forResource: "menu", withExtension: "mp3") else { return }
////        do {
////            audioPlayer = try AVAudioPlayer(contentsOf: url)
////            audioPlayer?.play()
////        } catch {
////            print("Errore nella riproduzione del suono: \(error.localizedDescription)")
////        }
////    }
////    var body: some View{
////
////
////        VStack(spacing: 35){
////
////            VStack(spacing: 15){
////                Text("BALLSATHLON")
////                    .font(.custom("customRegular", size: 36))
////                    .fontWeight(.bold)
////                    .foregroundColor(.black)
////                    .padding(.top, 50.0)
////
////
////
////
////
////                Text("Repeat the sequence of balls when it is your turn.")
////                    .font(.custom("customCorsivo", size: 36))
////                    .fontWeight(.bold)
////                    .foregroundColor(.black)
////            }
////            Spacer()
////
////
////            VStack(spacing: 15){
////                NavigationLink(destination: ContentViewBallsLevel1()){
////                    //                    ButtonGameModelView(game: Game(id: 40, title: "Level 1", image: "brain"))
////                    ZStack{
////                        Rectangle()
////                            .foregroundColor(Color("CustomPurple"))
////                            .frame(width: 200, height: 50)
////                            .cornerRadius(36)
////
////                        Text("Level 1")
////                            .font(.custom("customRegular", size: 36))
////                            .foregroundColor(.white)
////                            .onTapGesture {
////                                playSound()
////                            }
////                    }
////                }
////
////
////
////                NavigationLink(destination: ContentViewBallsLevel2()){
////                    //                    ButtonGameModelView(game: Game(id: 41, title: "Level 2", image: "brain"))
////
////                    ZStack{
////                        Rectangle()
////                            .foregroundColor(Color("CustomPurple"))
////                            .frame(width: 200, height: 50)
////                            .cornerRadius(36)
////
////                        Text("Level 2")
////                            .font(.custom("customRegular", size: 36))
////                            .foregroundColor(.white)
////                            .onTapGesture {
////                                playSound()
////                            }
////                    }
////                }
////
////
////
////
////                NavigationLink(destination: ContentViewBallsLevel3()){
////                    //                    ButtonGameModelView(game: Game(id: 42, title: "Level 3", image: "brain"))
////                    ZStack{
////                        Rectangle()
////                            .foregroundColor(Color("CustomPurple"))
////                            .frame(width: 200, height: 50)
////                            .cornerRadius(36)
////
////                        Text("Level 3")
////                            .font(.custom("customRegular", size: 30))
////                            .foregroundColor(.white)
////                            .onTapGesture {
////                                playSound()
////                            }
////                    }
////                }
////
////
////
////            }.navigationBarBackButtonHidden(false)
////            Spacer()
////        }
////
////    }
////
////
////}
////
////
////
////
////struct BallsGameMenuLevel_Previews: PreviewProvider {
////    static var previews: some View {
////        BallsGameMenuLevel()
////    }
////}
//
//struct BallsGameMenuLevel: View {
//    @State private var audioPlayer: AVAudioPlayer?
//    
//
//    
//    var body: some View {
//        
//        ZStack{
//            Image("sfondo istruzioni gioco")
//                .resizable()
//                .scaledToFill()
//                .edgesIgnoringSafeArea(.all)
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//        VStack() {
//            Spacer()
//            VStack(alignment: .leading, spacing: 15) {
//                Text("BALLSATHLON")
//                    .font(.custom("Figtree-ExtraBold", size: 48))
//                    .fontWeight(.bold)
//                    .foregroundColor(.black)
//                    .padding(.top, 50.0)
//                
//                Text("Repeat the sequence of balls when it is your turn.")
//                    .font(.custom("customCorsivo", size: 36))
//                    .fontWeight(.bold)
//                    .foregroundColor(.black)
//            }
//            Spacer()
//            
//            HStack(spacing: 15) {
//                NavigationLink(destination: GameBallsLevel1()) {
//                    ZStack {
//                        Rectangle()
//                            .foregroundColor(Color("CustomPurple"))
//                            .frame(width: 200, height: 60)
//                            .cornerRadius(16)
//                        
//                        Text("Level 1")
//                            .font(.custom("customRegular", size: 36))
//                            .foregroundColor(.white)
//                    }
//                }
////                .simultaneousGesture(
////                    TapGesture().onEnded {
////                        
////                    }
////                )
//                
//                NavigationLink(destination: GameBallsLevel2()) {
//                    ZStack {
//                        Rectangle()
//                            .foregroundColor(Color("CustomPurple"))
//                            .frame(width: 200, height: 50)
//                            .cornerRadius(16)
//                        
//                        Text("Level 2")
//                            .font(.custom("customRegular", size: 36))
//                            .foregroundColor(.white)
//                    }
//                }
////                .simultaneousGesture(
////                    TapGesture().onEnded {
////
////                    }
////                )
//                
//                NavigationLink(destination: GameBallsLevel3()) {
//                    ZStack {
//                        Rectangle()
//                            .foregroundColor(Color("CustomPurple"))
//                            .frame(width: 200, height: 50)
//                            .cornerRadius(16)
//                        
//                        Text("Level 3")
//                            .font(.custom("customRegular", size: 30))
//                            .foregroundColor(.white)
//                    }
//                }
////                .simultaneousGesture(
////                    TapGesture().onEnded {
////                        playSoundF()
////                    }
////                )
//            }
//            .navigationBarBackButtonHidden(false)
//            
//            Spacer()
//        }
//    }
//}
//}
//
//struct BallsGameMenuLevel_Previews: PreviewProvider {
//    static var previews: some View {
//        BallsGameMenuLevel()
//    }
//}
