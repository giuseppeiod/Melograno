//
//  GameMemoryModel.swift
//  MelogranoProject
//
//  Created by Giuseppe Iodice on 16/05/23.
//
import Foundation

class GameMemoryModel: ObservableObject {
    var model = CardMemory.createCardList()
    @Published var progress: CGFloat = 0
    var cards: [CardMemory] {
        model
    }
    var allCardsMatched: Bool {
        return cards.allSatisfy { $0.isMatched }
    }
    
    @Published var isGameFinished: Bool = false
    
    var chosenCards: [CardMemory] = []
    
    
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
        model = CardMemory.createCardList()
        isGameFinished = false
        progress = 0
        chosenCards.removeAll()
    
    }
    
     func areAllCardsMatched() -> Bool {
         
        return cards.allSatisfy { $0.isMatched }
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

