//
//  GameMemoryModel.swift
//  MelogranoProject
//
//  Created by Giuseppe Iodice on 16/05/23.
//

import Foundation



class GameMemoryModel: ObservableObject {
    @Published var model: [CardMemory] = []
    @Published var progress: CGFloat = 0
    var cards: [CardMemory] {
        model
    }
    var allCardsMatched: Bool {
        return cards.allSatisfy { $0.isMatched }
    }
    
    @Published var isGameFinished: Bool = false
    
    var chosenCards: [CardMemory] = []
    
    
    
    
    
    init() {
        if let newCards = loadCardsFromJSON() {
            model = newCards
        }
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
            progress += 0.333
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [self] in
                cards[firstIndex].isFaceUp = false
                cards[secondIndex].isFaceUp = false
            }
        }
        
        chosenCards.removeAll()
    }
    
    func resetGame() {
        if let newCards = loadCardsFromJSON() {
            model = newCards
            isGameFinished = false
        }
    }
    
    func areAllCardsMatched() -> Bool {
        return cards.allSatisfy { $0.isMatched }
    }
    
    func loadCardsFromJSON() -> [CardMemory]? {
        if let url = Bundle.main.url(forResource: "MemoryCards", withExtension: "geojson"),
           let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            if let cardData = try? decoder.decode([CardData].self, from: data) {
                let selectedCards = Array(cardData.prefix(3))
                let duplicatedCards = selectedCards.flatMap { [$0, $0] }
                return duplicatedCards.map { CardMemory(imageName: $0.imageName) }
            }
        }
        return nil
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
    let id: Int
    let imageName: String
}
