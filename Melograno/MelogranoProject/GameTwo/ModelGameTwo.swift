//
//  ModelGameTwo.swift
//  MelogranoProject
//
//  Created by Giuseppe Iodice on 31/05/23.
//

import Foundation
import SwiftUI

class ModelGameTwo: ObservableObject {
    
    @Published var cards: [CardGameTwo] = []
    @Published var cardsToOrder: [WorldCard] = []
    
    @Published var selectedWorldCard: WorldCard?
    @Published var selectedCardIndex: Int?
    @Published var selectedCardToOrderIndex: Int?

    @Published var hiddenCardIDs: Set<Int> = []
    @Published var blurredCardIndex: Set<Int> = []



    init() {
        loadJson()
    }

    func loadJson() {
        if let cardDataURL = Bundle.main.url(forResource: "Game2", withExtension: "geojson"),
           let worldCardDataURL = Bundle.main.url(forResource: "Game3", withExtension: "geojson") {

            do {
                let cardData = try Data(contentsOf: cardDataURL)
                let worldCardData = try Data(contentsOf: worldCardDataURL)
                let decoder = JSONDecoder()

                // Modifica qui: decodifica un array di array di oggetti
                let cardDataDecoded = try decoder.decode([[CardGameTwo]].self, from: cardData)
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

        hiddenCardIDs.toggleElement(cardID)

        if cardsToOrder[index].imageName != "" {
            cardsToOrder[index].imageName = ""
        }
    }

    func replaceCardImage() {
        guard let selectedIndex = selectedCardIndex,
              let selectedToOrderIndex = selectedCardToOrderIndex,
              selectedIndex >= 0 && selectedIndex < cards.count,
              selectedToOrderIndex >= 0 && selectedToOrderIndex < cardsToOrder.count,
              cardsToOrder[selectedToOrderIndex].imageName.isEmpty
        else {
            return
        }

        let selectedCard = cards[selectedIndex]
        let cardID = cards[selectedIndex].id


        
                if blurredCardIndex.contains(cardID) {
                    blurredCardIndex.removeAll()
                }
//                else {
//                    blurredCardIndex.insert(cardID)
//                }

        if hiddenCardIDs.contains(cardID) {
            hiddenCardIDs.remove(cardID)
        }
        else {
            hiddenCardIDs.insert(cardID)
        }

        cardsToOrder[selectedToOrderIndex].imageName = selectedCard.imageName

        selectedCardIndex = nil
        selectedCardToOrderIndex = nil
    }
    

}
//
//extension Set {
//    mutating func toggleElement(_ element: Element) {
//        if contains(element) {
//            remove(element)
//        } else {
//            insert(element)
//        }
//    }
//}
