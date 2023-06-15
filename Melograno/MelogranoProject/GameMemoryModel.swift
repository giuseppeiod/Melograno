//
//  GameMemoryModel.swift
//  MelogranoProject
//
//  Created by Giuseppe Iodice on 16/05/23.
//

import Foundation

import AVFoundation
import SwiftUI


class GameMemoryModel: ObservableObject {
    
    @Published var model: [CardMemory] = []
    @Published var audioPlayer: AVAudioPlayer?
    @Published  var isGameFinishedButton = false
    
    @Published var flippedCards: [Int] = []
    @Published var flippedWrongCards: [Int] = []
    
    @Published var shouldResetCards = false
    
    @Published var numberOfCards: Int?
    
    @Published var cards: [CardMemory] = []
    var allCardsMatched: Bool {
        return cards.allSatisfy { $0.isMatched }
    }
    
    @Published var isGameFinished: Bool = false
    
    var chosenCards: [CardMemory] = []
    
    
    

    
    
    init() {
        if let newCards = loadCardsFromJSON() {
            model = newCards
            if let soundURL = Bundle.main.url(forResource: "notifica", withExtension: "mp3") {
                audioPlayer = try? AVAudioPlayer(contentsOf: soundURL)
            }
        }
      
    }
    
    
    static func withNumberOfCards(_ numberOfCards: Int) -> GameMemoryModel {
        let model = GameMemoryModel()
        model.numberOfCards = numberOfCards
        model.cards = model.loadCardsFromJSON()!
        model.cards = model.cards.shuffled()
        return model
    }

    
    func choose(_ card: CardMemory) {
        guard !isGameFinished else {
            return
        }
        
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched {
            
            if chosenCards.count < 2 {
                cards[chosenIndex].isFaceUp = true
                chosenCards.append(cards[chosenIndex])
                
                if chosenCards.count == 2 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.compareCards()
                        
                        if self.areAllCardsMatched() {
                            self.isGameFinished = true
                        }
                    }
                }
            }
            
        }
    }
    
    private func compareCards() {
        guard chosenCards.count == 2 else {
            fatalError("Invalid number of chosen cards")
            
        }
        
        let firstCardIndex = cards.firstIndex(where: { $0.id == chosenCards[0].id })
        let secondCardIndex = cards.firstIndex(where: { $0.id == chosenCards[1].id })
        
        guard let firstIndex = firstCardIndex, let secondIndex = secondCardIndex else {
            fatalError("Invalid card indices")
        }
        
        if chosenCards[0].imageName == chosenCards[1].imageName {
            cards[firstIndex].isMatched = true
            cards[secondIndex].isMatched = true
           
            audioPlayer?.play()
//non scompaiono più le carte una volta accoppiate ma il suono funziona 
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [self] in
                cards[firstIndex].isFaceUp = false
                cards[secondIndex].isFaceUp = false
            }
        }
        
        chosenCards.removeAll()
    }
    

    
    func areAllCardsMatched() -> Bool {
        return cards.allSatisfy { $0.isMatched }
    }
    


    func loadCardsFromJSON() -> [CardMemory]? {
        if let url = Bundle.main.url(forResource: "MemoryCards", withExtension: "geojson"),
           let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            if let cardData = try? decoder.decode([CardData].self, from: data) {
                let shuffledCards = cardData.shuffled()
                let selectedCards = Array(shuffledCards.prefix(numberOfCards ?? 2))
                let duplicatedCards = selectedCards.flatMap { [$0, $0] }
                return duplicatedCards.map { CardMemory(imageName: $0.imageName) }
            }
        }
        return []
    }

    
    func flipCard(_ index: Int) {
            withAnimation {
                if flippedCards.contains(index) {
                    flippedCards.removeAll { $0 == index }
                } else {
                    flippedCards.append(index)

                    // Verifica il match delle carte
                    if flippedCards.count == 2 {
                        let firstCardIndex = flippedCards[0]
                        let secondCardIndex = flippedCards[1]

                        if cards[firstCardIndex].id != cards[secondCardIndex].id {
                            flippedWrongCards.append(contentsOf: flippedCards)
                            shouldResetCards = true
                        }

                        flippedCards.removeAll()
                    }
                }
            }
        }

        func restartGame() {
            cards.removeAll()
            flippedCards.removeAll()
            flippedWrongCards.removeAll()
            isGameFinished = false
            cards = loadCardsFromJSON()!
        }
    
}

extension Array {
    var oneAndOnly: Element? {
        if count == 1 {
            return first
        } else {
            return nil
        }
    }
}

struct CardData: Codable {
//    let id: Int
    let imageName: String
}
