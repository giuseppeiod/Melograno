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
    
    @State private var sequence = generateRandomSequence(dim: Int.random(in: 3...7))
    @State private var highlight = [false, false, false]
    @State private var playerSequence: [String] = []
    @State private var isPlayerTurn = false
    @State private var isAnimating = false
    @State private var gameResult: String = ""

    var body: some View {
        
        if isGameFinishedButton{
            ContentView()
        }else{
            VStack {
                
                Button(action: {
     
                    isGameFinishedButton = true
                    
                    print("Button pressed")
                    
       
                }) {
                    Image(systemName: "xmark")
                        .font(.title)
                        .foregroundColor(.gray)
                }
                
                
                BallsView(isHighlighted: $highlight[0], color: .red)
                    .onTapGesture {
                        if !isAnimating {
                            circleTapped("r")
                        }
                    }
                BallsView(isHighlighted: $highlight[1], color: .green)
                    .onTapGesture {
                        if !isAnimating {
                            circleTapped("g")
                        }
                    }
                BallsView(isHighlighted: $highlight[2], color: .blue)
                    .onTapGesture {
                        if !isAnimating {
                            circleTapped("b")
                        }
                    }
                Text(gameResult)
                Button(action: restartGame) {
                    Text("Restart Game")
                }
            }
            .onAppear(perform: animateCircles)
        }}

    func animateCircles() {
        print(sequence)
        isAnimating = true
        for i in 0..<sequence.count {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i * 2)) {
                let index = getColorIndex(from: sequence[i])
                highlight[index] = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    highlight[index] = false
                    if i == sequence.count - 1 {
                        isPlayerTurn = true
                        isAnimating = false
                    }
                }
            }
        }
    }

    func circleTapped(_ color: String) {
        if isPlayerTurn {
            let index = getColorIndex(from: color)
            highlight[index] = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                highlight[index] = false
            }
            playerSequence.append(color)
            if playerSequence.count == sequence.count {
                if playerSequence == sequence {
                    gameResult = "Hai vinto!"
                } else {
                    gameResult = "Hai perso. Riprova!"
                }
                isPlayerTurn = false
                playerSequence = []
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
        sequence = generateRandomSequence(dim: Int.random(in: 3...7))
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
    for _ in 0..<dim {
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
    return sequence
}


struct BallsContentView_Previews: PreviewProvider {
    static var previews: some View {
        BallsContentView()
    }
}
