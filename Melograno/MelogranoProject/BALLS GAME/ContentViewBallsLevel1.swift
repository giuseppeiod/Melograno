//
//  BallsContentView.swift
//  MelogranoProject
//
//  Created by Rita Marrano on 16/05/23.
//

import SwiftUI

import SwiftUI

import AVFoundation

struct ContentViewBallsLevel1: View {
    
    
    
    @State private var isGameFinishedButton = false
    
    @State private var sequence = generateRandomSequence(dim: 0)
    @State private var highlight = [false, false, false]
    
    @State private var playerSequence: [String] = []
    @State private var isPlayerTurn = false
    @State private var isAnimating = false
    
    @State private var gameResult: String = ""
    
    @State private var currentSequenceIndex = 0
    @State private var correctSequences = 0
    @State private var audioPlayer: AVAudioPlayer?
    
    var body: some View {
       
        if isGameFinishedButton{
            BallsGameMenuLevel()
        }else{

            VStack(alignment: .center, spacing: 70 ){
              
                Button(action: {
                    
                    isGameFinishedButton = true
                    
                    print("Button pressed")
                    
                    
                }) {
                    Image(systemName: "xmark")
                        .font(.title)
                        .foregroundColor(.gray)
                }

                Text("Tap the balls after they lit up ")
                    .font(.title)
                    .fontWeight(.semibold)
                

                HStack {
                    
                    
                    
                    BallsView(isHighlighted: $highlight[0], color: .red)
                        .onTapGesture {
                            if !isAnimating && isPlayerTurn {
                                circleTapped("r")
                                provideHapticFeedback()
                                audioPlayer?.play()
                            }
                        }
                    BallsView(isHighlighted: $highlight[1], color: .green)
                        .onTapGesture {
                            if !isAnimating && isPlayerTurn {
                                circleTapped("g")
                                provideHapticFeedback()
                                audioPlayer?.play()
                            }
                        }
                    BallsView(isHighlighted: $highlight[2], color: .blue)
                        .onTapGesture {
                            if !isAnimating && isPlayerTurn {
                                circleTapped("b")
                                provideHapticFeedback()
                                audioPlayer?.play()
                            }
                        }
                }
                //spostato la scritta
                Text(gameResult)

                
                Button(action: restartGame) {
                    Text("Restart Game")
                }
            }
            .onAppear(perform: animateCircles)
            .onAppear {
                do {
                    if let soundURL = Bundle.main.url(forResource: "notifica", withExtension: "wav") {
                        audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                    }
                } catch {
                    print("Failed to load sound file")
                }
            }
        }}
    
    func animateCircles() {
        print(sequence)
        //gameresult è per far si che scompare la scritta quando ricomincio
        gameResult = ""
        isAnimating = true
        var index = 0
        Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true) { timer in
            if index < sequence.count {
                let color = sequence[index]
                let colorIndex = getColorIndex(from: color)
                highlight[colorIndex] = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    highlight[colorIndex] = false
                    index += 1
                }
            } else {
                timer.invalidate()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    isPlayerTurn = true
                    isAnimating = false
                }
            }
        }
    }
    
    
    
    
    func circleTapped(_ color: String) {
        if isPlayerTurn && !isAnimating {
            let expectedColorIndex = playerSequence.count
            if expectedColorIndex < sequence.count {
                let expectedColor = sequence[expectedColorIndex]
                if color == expectedColor {
                    let index = getColorIndex(from: color)
                    highlight[index] = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        highlight[index] = false
                        playerSequence.append(color)
                        if playerSequence.count == sequence.count {
                            if currentSequenceIndex == 6 {
                                gameResult = "You won!"
                                isPlayerTurn = false
                            } else {
                                gameResult = "Well done! Keep it going."
                                isPlayerTurn = false
                                playerSequence = []
                                currentSequenceIndex += 1
                                sequence = generateRandomSequence(dim: currentSequenceIndex )
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                    animateCircles()
                                }
                            }
                        }
                    }
                } else {
                    gameResult = "Game over, try again!"
                    isPlayerTurn = false
                    playerSequence = []
                    currentSequenceIndex = 0
                    sequence = generateRandomSequence(dim: 0)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        animateCircles()
                    }
                }
            } else {
                print("Errore: Indice out of range")
            }
        }
    }








    func getColorIndex(from char: String) -> Int {
        switch char {
        case "r":
            return 0
        case "g":
            return 1
        case "b":
            return 2
        default:
            return -1
        }
    }

    func restartGame() {
        sequence = generateRandomSequence(dim: 1)
        highlight = [false, false, false]
        playerSequence = []
        isPlayerTurn = false
        isAnimating = false
        gameResult = ""
        animateCircles()
    }
}

private func generateRandomSequence(dim: Int) -> [String] {
    var sequence: [String] = []
    for i in 0..<dim {
        let randomColor = Int.random(in: 0...2)
        switch randomColor {
        case 0:
            sequence.append("r")
        case 1:
            sequence.append("g")
        case 2:
            sequence.append("b")
        default:
            break
        }
    }
    
    // Aggiungi un colore extra alla fine della sequenza
    let randomColor = Int.random(in: 0...2)
    switch randomColor {
    case 0:
        sequence.append("r")
    case 1:
        sequence.append("g")
    case 2:
        sequence.append("b")
    default:
        break
    }
    
    return sequence
}

private func provideHapticFeedback() {
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .medium)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
    }



struct ContentViewBallsLevel1_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewBallsLevel1()
    }
}