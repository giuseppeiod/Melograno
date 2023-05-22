//
//  ViewModelGame2.swift
//  MelogranoProject
//
//  Created by Giuseppe Iodice on 22/05/23.
//

import SwiftUI
import Foundation

class ViewModelGame2: ObservableObject{
    
    @Published var cards: [Card2]
    @Published var cardsToOrder: [WorldCard]
    @Published var selectedCardIndex: Int?
    @Published var selectedCardToOrderIndex: Int?
    @Published var selectedWorldCard: WorldCard?
    
    @Published var hiddenCardIDs: Set<Int> = []
    
    init() {
        // Inizializza i dati
        _cards = Published(initialValue: [
            Card2(id: 0, imageName: "uno"),
            Card2(id: 1, imageName: "due"),
            Card2(id: 2, imageName: "tre"),
            Card2(id: 3, imageName: "quattro")
        ])
        
        _cardsToOrder = Published(initialValue: [
            WorldCard(id: 4, text: "Uno", imageName: ""),
            WorldCard(id: 5, text: "Due", imageName: ""),
            WorldCard(id: 6, text: "Tre", imageName: ""),
            WorldCard(id: 7, text: "Quattro", imageName: "")
        ])
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
