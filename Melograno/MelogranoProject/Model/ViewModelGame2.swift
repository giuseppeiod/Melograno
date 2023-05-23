//
//  ViewModelGame2.swift
//  MelogranoProject
//
//  Created by Giuseppe Iodice on 22/05/23.
//

import SwiftUI
import Foundation

class ViewModelGame2: ObservableObject{
    
    @Published var cards: [Card2] = []
    @Published var cardsToOrder: [WorldCard] = []
    @Published var selectedCardIndex: Int?
    @Published var selectedCardToOrderIndex: Int?
    @Published var selectedWorldCard: WorldCard?
    
    @Published var hiddenCardIDs: Set<Int> = []
    
    init() {
        loadJson()
        
//        // Inizializza i dati
//        _cards = Published(initialValue: [
//            Card2(id: 0, imageName: "uno"),
//            Card2(id: 1, imageName: "due"),
//            Card2(id: 2, imageName: "tre"),
//            Card2(id: 3, imageName: "quattro")
//        ])
//
//        _cardsToOrder = Published(initialValue: [
//            WorldCard(id: 4, text: "Uno", imageName: ""),
//            WorldCard(id: 5, text: "Due", imageName: ""),
//            WorldCard(id: 6, text: "Tre", imageName: ""),
//            WorldCard(id: 7, text: "Quattro", imageName: "")
//        ])
    }
    
    
    func loadJson() {
        if let cardDataURL = Bundle.main.url(forResource: "Game2", withExtension: "geojson"),
           let worldCardDataURL = Bundle.main.url(forResource: "Game3", withExtension: "geojson") {

            do {
                let cardData = try Data(contentsOf: cardDataURL)
                let worldCardData = try Data(contentsOf: worldCardDataURL)
                let decoder = JSONDecoder()

                // Modifica qui: decodifica un array di array di oggetti
                let cardDataDecoded = try decoder.decode([[Card2]].self, from: cardData)
                let worldCardDataDecoded = try decoder.decode([[WorldCard]].self, from: worldCardData)

                // Seleziona un set casuale
                let setIndex = Int.random(in: 0..<cardDataDecoded.count)

                guard cardDataDecoded[setIndex].count == worldCardDataDecoded[setIndex].count else {
                    // Il numero di elementi nei due file JSON deve essere lo stesso
                    print("Errore: i file JSON contengono un numero diverso di elementi.")
                    return
                }

                // Prende solo i primi 4 elementi random
                self.cards = Array(cardDataDecoded[setIndex].shuffled().prefix(4))
                self.cardsToOrder = Array(worldCardDataDecoded[setIndex].shuffled().prefix(4))

                print("Caricamento dati riuscito!")
                print("cards: \(self.cards)")
                print("cardsToOrder: \(self.cardsToOrder)")

            } catch {
                print("Errore durante la lettura del file JSON: \(error)")
            }

        } else {
            print("Impossibile trovare i file JSON.")
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
        } else {
            hiddenCardIDs.insert(cardID)
        }
        
        if cardsToOrder[index].imageName != "" {
            cardsToOrder[index].imageName = ""
        }
    }


//    func replaceCardImage() {
//        guard let selectedIndex = selectedCardIndex,
//              let selectedToOrderIndex = selectedCardToOrderIndex,
//              selectedIndex >= 0 && selectedIndex < cards.count,
//              selectedToOrderIndex >= 0 && selectedToOrderIndex < cardsToOrder.count
//        else {
//            return
//        }
//
//        let selectedCard = cards[selectedIndex]
//        var updateCards = cards
//        updateCards[selectedIndex].isHidden.toggle()
//
//        var updatedCardsToOrder = cardsToOrder
//        updatedCardsToOrder[selectedToOrderIndex].imageName = selectedCard.imageName
//
//        cardsToOrder = updatedCardsToOrder
//
//        selectedCardIndex = nil
//        selectedCardToOrderIndex = nil
//    }
    func replaceCardImage(card:WorldCard,index:Int) {
        guard let selectedIndex = selectedCardIndex,
              let selectedToOrderIndex = selectedCardToOrderIndex,
              selectedIndex >= 0 && selectedIndex < cards.count,
              selectedToOrderIndex >= 0 && selectedToOrderIndex < cardsToOrder.count
        else {
            return
        }

        let selectedCard = cards[selectedCardIndex!]
//        print(selectedCard.imageName)
        var updateCards = cards
        updateCards[index].isHidden.toggle()
        
        var updatedCardsToOrder = cardsToOrder
        updatedCardsToOrder[index].imageName = selectedCard.imageName

        cardsToOrder = updatedCardsToOrder

        selectedCardIndex = nil
        selectedCardToOrderIndex = nil
    }
    
    

}
