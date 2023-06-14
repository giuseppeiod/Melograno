//
//  BallsModel.swift
//  MelogranoProject
//
//  Created by Rita Marrano on 09/06/23.
//
import SwiftUI
import Foundation
import AVFoundation
import UIKit

class BallsModel: ObservableObject{
    
    @Published  var isPresented: Bool = true
    
    @Published  var isViewVisible: Bool = true

    
    @Published var isGameFinished: Bool = false

    @Published var highlight: [Bool] = []
  
    @Published var isPlayerTurn: Bool = false
    @Published var isAnimating: Bool = false
    @Published var gameResult: String = ""
    @Published var currentSequenceIndex: Int = 0
    @Published var points: Int = 0
    @Published var correctSequences: Int = 0
    
    @Published var audioPlayer: AVAudioPlayer?
    
    
    @Published  var sequence: [String] = []
    @Published  var playerSequence: [String] = []

    @Published var numberOfCircles: Int?
    
    init() {
        generateNewSequence()
    }
    


    
    static func withNumberOfCircles(_ numberOfCircles: Int) -> BallsModel {
        let model = BallsModel()
        model.numberOfCircles = numberOfCircles
        model.highlight = Array(repeating: false, count: numberOfCircles )
        return model
    }
    
    func circleTapped(_ color: String) {
        if isPlayerTurn && !isAnimating {
            let expectedColorIndex = playerSequence.count
            if expectedColorIndex < sequence.count {
                let expectedColor = sequence[expectedColorIndex]
                
                let index = getColorIndex(from: color)
                withAnimation{
                    print(highlight)
                    highlight[index] = true
                }
                if color == expectedColor {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [self] in
                        withAnimation{
                            highlight[index] = false
                        }
                        playerSequence.append(color)
                        if playerSequence.count == sequence.count {
                            if sequence.count == 7 {
                                gameResult = "You won!"
                                isPlayerTurn = false
                                isGameFinished = true
                            } else {
                                gameResult = "Well done! Keep it going."
                                isPlayerTurn = false
                                currentSequenceIndex += 1
                                points += 1
                                playerSequence = []
                                
                                sequence = generateRandomSequence(dim: currentSequenceIndex, previousSequence: sequence, numberOfCircles: currentSequenceIndex)
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [self] in
                                    animateCircles()
                                }
                            }
                        }
                    }
                } else {
                    sequence.removeAll()
                    isPlayerTurn = false
                    playerSequence = []
                    currentSequenceIndex = 0
                    isGameFinished = true
                    

                }
            } else {
                print("Errore: Indice out of range")
            }
        }
    }

    
    func getColorIndex(from char: String) -> Int {
        switch char {
        case "a":
            return 0
        case "b":
            return 1
        case "c":
            return 2
        case "d":
            return 3
        case "e":
            return 4
        default:
            return -1
        }
    }
       
       func restartGame() {
           
           sequence = []
           generateNewSequence()
           sequence = generateRandomSequence(dim: 1, previousSequence: [], numberOfCircles: numberOfCircles ?? 3)
          points = 0
           currentSequenceIndex = 0
           correctSequences = 0
           generateNewSequence()
           isGameFinished = false
           isAnimating = false
           
           
       }
    
    func animateCircles() {
        gameResult = ""
        withAnimation{
            isAnimating = true
        }
        var index = 0
        
        Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true) { [self] timer in
            if index < sequence.count {
                let color = sequence[index]
                
                
                switch color {
                    case "a":
                        playSoundA()
                    case "b":
                        playSoundB()
                    case "c":
                        playSoundC()
                    case "d":
                        playSoundD()
                    case "e":
                        playSoundeE()
                    default:
                        break
                }

                playSound(for: color)
                let colorIndex = getColorIndex(from: color)
                withAnimation{
                    highlight[colorIndex] = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
                    withAnimation{
                        self.highlight[colorIndex] = false
                    }
                    index += 1
                }
            } else {
                timer.invalidate()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) { [self] in
                    self.isPlayerTurn = true
                    self.isAnimating = false
                }
            }
        }
    }
    
    func playSound(for color: String) {
        guard let url = Bundle.main.url(forResource: color, withExtension: "mp3") else { return }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
    
    private func generateNewSequence() {
        highlight = Array(repeating: false, count: numberOfCircles ?? 3)
        sequence = generateRandomSequence(dim: currentSequenceIndex + 1, previousSequence: [], numberOfCircles: numberOfCircles ?? 3 )
       print(sequence)
        playerSequence = []
        isPlayerTurn = false
        isAnimating = false
        gameResult = ""
    }

    
    private func generateRandomSequence(dim: Int, previousSequence: [String], numberOfCircles: Int) -> [String] {
        var sequence: [String] = previousSequence
        
        if dim >= sequence.count {
            let randomIndex = Int.random(in: 0..<numberOfCircles)
            let randomColor = getColorFromIndex(randomIndex)
            sequence.append(randomColor)
        }
        
        return sequence
    }


    private func getColorFromIndex(_ index: Int) -> String {
        switch index {
        case 0:
            return "a"
        case 1:
            return "b"
        case 2:
            return "c"
        case 3:
            return "d"
        case 4:
            return "e"
        default:
            return " "
        }
    }


    
    
    func playSoundA() {
        
        guard isViewVisible else {
            return
        }
        guard let url = Bundle.main.url(forResource: "a", withExtension: "mp3") else { return }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
            print("dovrei ma non suono")
        } catch {
            print("Errore nella riproduzione del suono: \(error.localizedDescription)")
        }
    }
    
    func playSoundB() {
        guard isViewVisible else {
            return
        }
        guard let url = Bundle.main.url(forResource: "b", withExtension: "mp3") else { return }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
            print("dovrei ma non suono")
        } catch {
            print("Errore nella riproduzione del suono: \(error.localizedDescription)")
        }
    }
    
    func playSoundC() {
        guard isViewVisible else {
            return
        }
        guard let url = Bundle.main.url(forResource: "c", withExtension: "mp3") else { return }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
            print("dovrei ma non suono")
        } catch {
            print("Errore nella riproduzione del suono: \(error.localizedDescription)")
        }
    }
    
    func playSoundD() {
        guard isViewVisible else {
            return
        }
        guard let url = Bundle.main.url(forResource: "d", withExtension: "mp3") else { return }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
            print("dovrei ma non suono")
        } catch {
            print("Errore nella riproduzione del suono: \(error.localizedDescription)")
        }
    }
    
    func playSoundeE() {
        guard isViewVisible else {
            return
        }
        guard let url = Bundle.main.url(forResource: "e", withExtension: "mp3") else { return }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
            print("dovrei ma non suono")
        } catch {
            print("Errore nella riproduzione del suono: \(error.localizedDescription)")
        }
    }

    func provideHapticFeedback() {
           let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .medium)
           impactFeedbackgenerator.prepare()
           impactFeedbackgenerator.impactOccurred()
       }

}


enum BallType: String {
    case red = "a"
    case green = "b"
    case blue = "c"
    case orange = "d"
    case purple = "e"
}



