//
//  Card1View.swift
//  MelogranoProject
//
//  Created by Rita Marrano on 17/05/23.
//


import SwiftUI

class ViewModelGame1: ObservableObject{
    
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



