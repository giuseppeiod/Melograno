//
//  ModelGameOne.swift
//  MelogranoProject
//
//  Created by Rita Marrano on 30/05/23.
//

import Foundation
import SwiftUI

class ModelGameOne: ObservableObject {
    @Published var cards: [CardGameOne] = []
    @Published var cardsToOrder: [CardGameOne] = []

    @Published var selectedCardIndex: Int?
    @Published var selectedCardToOrderIndex: Int?

    @Published var hiddenCardIDs: Set<Int> = []
    
    @Published var blurredCardIndex: Set<Int> = []



    init() {
        loadJson()
    }

    func loadJson() {
        if let url = Bundle.main.url(forResource: "Game1", withExtension: "geojson") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([[CardGameOne]].self, from: data)

                let randomCardsData = jsonData.randomElement() ?? []

                self.cards = randomCardsData.map { CardGameOne(id: $0.id, correctIndex: $0.correctIndex, imageName: $0.imageName) }.shuffled()

                self.cardsToOrder = self.cards.enumerated().map {
                    CardGameOne(id: $0.offset + self.cards.count + 1, correctIndex: $0.element.correctIndex, imageName: "")
                }

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
        
        cards[index].selected = false
        
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

        cards[selectedIndex].selected = false
        
             
                    blurredCardIndex.removeAll()
                
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

extension Set {
    mutating func toggleElement(_ element: Element) {
        if contains(element) {
            remove(element)
        } else {
            insert(element)
        }
    }
}
