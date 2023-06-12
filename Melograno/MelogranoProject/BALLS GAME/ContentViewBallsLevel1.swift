//
//  BallsContentView.swift
//  MelogranoProject
//
//  Created by Rita Marrano on 16/05/23.
//

//import SwiftUI
//
//import SwiftUI
//
//import AVFoundation
//
//struct ContentViewBallsLevel1: View {
//    
//    
//    
//    @State private var isGameFinishedButton = false
//    
//    @State private var sequence = generateRandomSequence(dim: 1, previousSequence: [])
//    @State private var highlight = [false, false, false]
//    
//    @State private var playerSequence: [String] = []
//    @State private var isPlayerTurn = false
//    @State private var isAnimating = false
//    
//    
//    @State private var gameResult: String = ""
//    
//    @State private var currentSequenceIndex = 0
//    @State private var correctSequences = 0
//    
//    @State private var audioPlayer: AVAudioPlayer?
//    
//    var body: some View {
//       
//
//            ZStack(){
//                
//                VStack(alignment: .leading){
//
//                    Text("Ballsathlon")
//                        .font(.custom("Figtree-ExtraBold", size: 48))
//                       
//                    Text("Tap the balls sequence after they lit up ")
//                        .font(.custom("Figtree-Regular", size: 48))
//   
//                            Spacer()
//
//                }
//               
//            
//                
//                VStack(){
//                    
//     
//                    if !isAnimating && isPlayerTurn{
//                        Text("Your turn!")
//                            .font(.custom("Figtree-ExtraBold", size: 64))
//                            .foregroundColor(Color("CustomPurple"))
//                        
//                    }
//                    
//                    
//                    Text(gameResult)
//                        .font(.custom("Figtree-ExtraBold", size: 64))
//                        .foregroundColor(Color("CustomPurple"))
//
//                }.padding(.bottom, 100)
//
//
//                
//                VStack(spacing: 40){
//                    Spacer()
//
//                    VStack(spacing: 40){
//                        HStack(spacing: 60){
//                            
//                            
//                            
//                            BallsView(isHighlighted: $highlight[0], color: bottoni[0])
//                                .onTapGesture {
//                                    if !isAnimating && isPlayerTurn {
//                                        
//                                        circleTapped("r")
//                                        provideHapticFeedback()
//                                    }
//                                }
//                                .simultaneousGesture(
//                                    TapGesture().onEnded { _ in
//                                        playSoundA()
//                                    }
//                                )
//
//
//                            
//                            BallsView(isHighlighted: $highlight[1], color: .green)
//                                .onTapGesture {
//                                    if !isAnimating && isPlayerTurn {
//                                 
//                                        
//                                        circleTapped("g")
//                                        
//                                        provideHapticFeedback()
//     
//                                        
//                                    }
//                                }
//                                .simultaneousGesture(
//                                    TapGesture().onEnded {
//                                        playSoundB()
//                                    }
//                                )
//                            BallsView(isHighlighted: $highlight[2], color: .blue)
//                                .onTapGesture {
//                                    
//                                    
//                                    
//                                   
//                                    
//                                    if !isAnimating && isPlayerTurn {
//                                        circleTapped("b")
//                                        provideHapticFeedback()
//
//                                    }
//                                }                .simultaneousGesture(
//                                    TapGesture().onEnded {
//                                        playSoundF()
//                                    }
//                                )
//                            
//                        }.onAppear(perform: animateCircles)
// 
//                    }
//                }
//
//                if !isPlayerTurn && !isAnimating && sequence.count == 6{
//                Button(action: restartGame) {
//                    Text("Restart Game")
//                        .font(.custom("customRegular", size: 46))
//                   
//                }
//            }
//        }
//  }
//    
//    
//    func playSoundA() {
//        guard let url = Bundle.main.url(forResource: "a", withExtension: "mp3") else { return }
//        do {
//            audioPlayer = try AVAudioPlayer(contentsOf: url)
//            audioPlayer?.play()
//            print("dovrei ma non suono")
//        } catch {
//            print("Errore nella riproduzione del suono: \(error.localizedDescription)")
//        }
//    }
//    
//    func playSoundB() {
//        guard let url = Bundle.main.url(forResource: "c", withExtension: "mp3") else { return }
//        do {
//            audioPlayer = try AVAudioPlayer(contentsOf: url)
//            audioPlayer?.play()
//            print("dovrei ma non suono")
//        } catch {
//            print("Errore nella riproduzione del suono: \(error.localizedDescription)")
//        }
//    }
//    
//    func playSoundF() {
//        guard let url = Bundle.main.url(forResource: "f", withExtension: "mp3") else { return }
//        do {
//            audioPlayer = try AVAudioPlayer(contentsOf: url)
//            audioPlayer?.play()
//            print("dovrei ma non suono")
//        } catch {
//            print("Errore nella riproduzione del suono: \(error.localizedDescription)")
//        }
//    }
//    
////    func playSoundF() {
////        let systemSoundID: SystemSoundID = 1005 // Suono di notifica predefinito
////        AudioServicesPlaySystemSound(systemSoundID)
////    }
//
//    
//    
//    func animateCircles() {
//        print(sequence)
//
//        gameResult = ""
//        isAnimating = true
//        var index = 0
//
//        Timer.scheduledTimer(withTimeInterval: 2.5, repeats: true) { timer in
//            if index < sequence.count {
//                let color = sequence[index]
//                
//                switch color {
//                case "r":
//                    playSoundA()
//                case "g":
//                    playSoundB()
//                case "b":
//                    playSoundF()
//                default:
//                    break
//                }
//                let colorIndex = getColorIndex(from: color)
//                highlight[colorIndex] = true
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//                    highlight[colorIndex] = false
//                    index += 1
//                    
////                    switch color {
////                    case "r":
////                        playSoundA()
////                    case "g":
////                        playSoundB()
////                    case "b":
////                        playSoundF()
////                    default:
////                        break
////                    }
//                }
//            } else {
//                timer.invalidate()
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
//                    isPlayerTurn = true
//                    isAnimating = false
//                }
//            }
//        }
//    }
//
//    
//    
//
//
//
//    func circleTapped(_ color: String) {
//        if isPlayerTurn && !isAnimating {
//            let expectedColorIndex = playerSequence.count
//            if expectedColorIndex < sequence.count {
//                let expectedColor = sequence[expectedColorIndex]
//                
//                let index = getColorIndex(from: color)
//                highlight[index] = true
//                
//                if color == expectedColor {
////                    let index = getColorIndex(from: color)
////                    highlight[index] = true
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//                        highlight[index] = false
//                        playerSequence.append(color)
//                        if playerSequence.count == sequence.count {
//                            if sequence.count == 6 {
//                                gameResult = "You won!"
//                                isPlayerTurn = false
//                            } else {
//                                gameResult = "Well done! Keep it going."
//                                isPlayerTurn = false
//                                currentSequenceIndex += 1
//                                playerSequence = []
//                                
//                                sequence = generateRandomSequence(dim: currentSequenceIndex, previousSequence: sequence)
//                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
//                                    animateCircles()
//                                }
//                            }
//                        }
//                    }
//                } else {
//                    gameResult = "Game over, try again!"
//                    isPlayerTurn = false
//                    playerSequence = []
//                    currentSequenceIndex = 0
//                    sequence = generateRandomSequence(dim: 1, previousSequence: [])
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
//                        animateCircles()
//                    }
//                }
//            } else {
//                print("Errore: Indice out of range")
//            }
//        }
//    }
//
//
//
//
//
//    func getColorIndex(from char: String) -> Int {
//        switch char {
//        case "r":
//            return 0
//        case "g":
//            return 1
//        case "b":
//            return 2
//        default:
//            return -1
//        }
//    }
//
//    func restartGame() {
//        sequence = generateRandomSequence(dim: 1, previousSequence: [])
//                // ...
//        highlight = [false, false, false]
//        playerSequence = []
//        isPlayerTurn = false
//        isAnimating = false
//        gameResult = ""
//        animateCircles()
//    }
//}
//
//
//
//
//private func generateRandomSequence(dim: Int, previousSequence: [String]) -> [String] {
//    var sequence: [String] = previousSequence
//    
//    if dim >= sequence.count {
//        let randomColor = Int.random(in: 0...2)
//        switch randomColor {
//        case 0:
//            sequence.append("r")
//        case 1:
//            sequence.append("g")
//        case 2:
//            sequence.append("b")
//        default:
//            break
//        }
//    }
//    
//    return sequence
//}
//
//
//
//
//
//
//
//
//
//
// func provideHapticFeedback() {
//        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .medium)
//        impactFeedbackgenerator.prepare()
//        impactFeedbackgenerator.impactOccurred()
//    }
//
//
//
//struct ContentViewBallsLevel1_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentViewBallsLevel1()
//    }
//}
