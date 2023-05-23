//
//  Card1View.swift
//  MelogranoProject
//
//  Created by Rita Marrano on 17/05/23.
//



import SwiftUI

class ViewModelGame1: ObservableObject {
    @Published var cards: [CardGame1] = []
    @Published var cardsToOrder: [CardGame1] = []
    @Published var selectedCardIndex: Int?
    @Published var selectedCardToOrderIndex: Int?

    @Published var hiddenCardIDs: Set<Int> = []

    init() {
        loadJson()
            
    }

    func loadJson() {
        if let url = Bundle.main.url(forResource: "Game1", withExtension: "geojson") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([[CardGame1]].self, from: data)

                // Seleziona un array di carte in modo casuale dal JSON
                let randomCardsData = jsonData.randomElement() ?? []

                // Converti i dati decodificati in CardGame1
                self.cards = randomCardsData.map { CardGame1(id: $0.id, correctIndex: $0.correctIndex, imageName: $0.imageName) }
                
                // Crea cardsToOrder con gli stessi elementi di cards ma con imageName vuoto e id differente
                self.cardsToOrder = self.cards.enumerated().map {
                    CardGame1(id: $0.offset + self.cards.count + 1, correctIndex: $0.element.correctIndex, imageName: "")
                }

                // Aggiungi un po' di logging
                print("Caricamento dati riuscito!")
                print("cards: \(self.cards)")
                print("cardsToOrder: \(self.cardsToOrder)")

            } catch {
                print("Errore durante la lettura del file JSON: \(error)")
            }
        } else {
            print("Impossibile trovare il file JSON.")
        }
    }





    var allCardsPlaced: Bool {
        return cardsToOrder.allSatisfy { $0.imageName != "" }
    }

    func resetCardToOrderImage(at index: Int) {
        guard index >= 0 && index < cardsToOrder.count else {
            return
        }

        let imageName = cardsToOrder[index].imageName

        guard let originalCardIndex = cards.firstIndex(where: { $0.imageName == imageName }) else {
            return
        }

        let cardID = cards[originalCardIndex].id

        if hiddenCardIDs.contains(cardID) {
            hiddenCardIDs.remove(cardID)
        }
        else {
            hiddenCardIDs.insert(cardID)
        }

        if cardsToOrder[index].imageName != "" {
            cardsToOrder[index].imageName = ""
        }
    }

    func replaceCardImage() {
        guard let selectedIndex = selectedCardIndex,
              let selectedToOrderIndex = selectedCardToOrderIndex,
              selectedIndex >= 0 && selectedIndex < cards.count,
              selectedToOrderIndex >= 0 && selectedToOrderIndex < cardsToOrder.count
        else {
            return
        }

        let selectedCard = cards[selectedIndex]
        var updateCards = cards
        updateCards[selectedIndex].isHidden.toggle()

        var updatedCardsToOrder = cardsToOrder
        updatedCardsToOrder[selectedToOrderIndex].imageName = selectedCard.imageName

        cardsToOrder = updatedCardsToOrder

        selectedCardIndex = nil
        selectedCardToOrderIndex = nil
    }
}

/*class ViewModelGame1: ObservableObject{
    
    @Published var cards: [CardGame1]
    @Published var cardsToOrder: [CardGame1]
    @Published var selectedCardIndex: Int?
    @Published var selectedCardToOrderIndex: Int?
    
    
    @Published var hiddenCardIDs: Set<Int> = []
    
    init() {
        
        // Inizializza i dati
        _cards = Published(initialValue: [
            CardGame1(id: 0, correctIndex: 1, imageName: "uno"),
            CardGame1(id: 1,correctIndex: 2, imageName: "due"),
            CardGame1(id: 2,correctIndex: 3, imageName: "tre"),
            CardGame1(id: 3,correctIndex: 4, imageName: "quattro")
        ])
        
        _cardsToOrder = Published(initialValue: [
            CardGame1(id: 4,correctIndex: 1, imageName: ""),
            CardGame1(id: 5,correctIndex: 2, imageName: ""),
            CardGame1(id: 6,correctIndex: 3, imageName: ""),
            CardGame1(id: 7,correctIndex: 4, imageName: "")
        ])
    }
   
//    func loadJson() {
//        if let url = Bundle.main.url(forResource: "Game2", withExtension: "json") {
//            do {
//                let data = try Data(contentsOf: url)
//                let decoder = JSONDecoder()
//                let jsonData = try decoder.decode([CardGame1].self, from: data)
//
//                // Assumiamo che il tuo JSON abbia le prime 4 carte per `cards` e le ultime 4 per `cardsToOrder`
//                self.cards = Array(jsonData[0..<4])
//                self.cardsToOrder = Array(jsonData[4..<8])
//
//            } catch {
//                print("Errore durante la lettura del file JSON: \(error)")
//            }
//        }
//    }

    
    var allCardsPlaced: Bool {
        return cardsToOrder.allSatisfy { $0.imageName != "" }
        }
    
    func resetCardToOrderImage(at index: Int) {
        guard index >= 0 && index < cardsToOrder.count else {
            return
        }
        
        let imageName = cardsToOrder[index].imageName
        
        guard let originalCardIndex = cards.firstIndex(where: { $0.imageName == imageName }) else {
            return
        }
        
        let cardID = cards[originalCardIndex].id
        
        if hiddenCardIDs.contains(cardID) {
            hiddenCardIDs.remove(cardID)
        } else {
            hiddenCardIDs.insert(cardID)
        }
        
        if cardsToOrder[index].imageName != "" {
            cardsToOrder[index].imageName = ""
        }
    }


    func replaceCardImage() {
        guard let selectedIndex = selectedCardIndex,
              let selectedToOrderIndex = selectedCardToOrderIndex,
              selectedIndex >= 0 && selectedIndex < cards.count,
              selectedToOrderIndex >= 0 && selectedToOrderIndex < cardsToOrder.count
        else {
            return
        }

        let selectedCard = cards[selectedIndex]
        var updateCards = cards
        updateCards[selectedIndex].isHidden.toggle()
        
        var updatedCardsToOrder = cardsToOrder
        updatedCardsToOrder[selectedToOrderIndex].imageName = selectedCard.imageName

        cardsToOrder = updatedCardsToOrder

        selectedCardIndex = nil
        selectedCardToOrderIndex = nil
    }

    
    

}
/*
 */*/
