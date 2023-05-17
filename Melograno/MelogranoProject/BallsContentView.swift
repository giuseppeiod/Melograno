//
//  BallsContentView.swift
//  MelogranoProject
//
//  Created by Rita Marrano on 16/05/23.
//

import SwiftUI

import SwiftUI

struct BallsContentView: View {
    
    
    
    @State private var isGameFinishedButton = false
    
    @State private var sequence = generateRandomSequence(dim: 1)
    @State private var highlight = [false, false, false]
    
    @State private var playerSequence: [String] = []
    @State private var isPlayerTurn = false
    @State private var isAnimating = false
    
    @State private var gameResult: String = ""
    
    @State private var currentSequenceIndex = 0
    @State private var correctSequences = 0
    
    
    var body: some View {
        
        if isGameFinishedButton{
            ContentView()
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
                
                
                HStack {
                    BallsView(isHighlighted: $highlight[0], color: .red)
                        .onTapGesture {
                            if !isAnimating && isPlayerTurn {
                                circleTapped("r")
                            }
                        }
                    BallsView(isHighlighted: $highlight[1], color: .green)
                        .onTapGesture {
                            if !isAnimating && isPlayerTurn {
                                circleTapped("g")
                            }
                        }
                    BallsView(isHighlighted: $highlight[2], color: .blue)
                        .onTapGesture {
                            if !isAnimating && isPlayerTurn {
                                circleTapped("b")
                            }
                        }
                    Text(gameResult)
                }
                
                Button(action: restartGame) {
                    Text("Restart Game")
                }
            }
            .onAppear(perform: animateCircles)
        }}
    
    func animateCircles() {
        print(sequence)
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
                                gameResult = "Hai vinto!"
                                isPlayerTurn = false
                            } else {
                                gameResult = "Sequenza completata. Continua!"
                                isPlayerTurn = false
                                playerSequence = []
                                currentSequenceIndex += 1
                                sequence = generateRandomSequence(dim: currentSequenceIndex + 1)
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                    animateCircles()
                                }
                            }
                        }
                    }
                } else {
                    gameResult = "Hai perso. Riprova!"
                    isPlayerTurn = false
                    playerSequence = []
                    currentSequenceIndex = 0
                    sequence = generateRandomSequence(dim: 1)
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

func generateRandomSequence(dim: Int) -> [String] {
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
        
        // Aggiungi un colore extra alla sequenza ogni volta che la lunghezza corrente raggiunge un multiplo di 2
        if (i + 1) % 2 == 0 {
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
    }
    return sequence
}


struct BallsContentView_Previews: PreviewProvider {
    static var previews: some View {
        BallsContentView()
    }
}
