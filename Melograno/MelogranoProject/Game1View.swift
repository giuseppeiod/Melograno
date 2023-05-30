//
//  Game1View.swift
//  MelogranoProject
//
//  Created by Giuseppe Iodice on 15/05/23.
//

import SwiftUI
import CoreData
import UniformTypeIdentifiers
import MobileCoreServices

extension Array {
    subscript(safe index: Index) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}

struct Game1View: View {
    
    @ObservedObject var model = ViewModelGame1()
    @State private var isGameFinishedButton = false
    
    
    var body: some View {
           VStack {
               if isGameFinishedButton {
                   ContentView()
               } else {
                   HStack {
                       Button(action: {
                           isGameFinishedButton = true
                           print("Button pressed")
                       }) {
                           HStack {
                               Image(systemName: "chevron.left")
                                   .font(.title)
                                   .foregroundColor(.gray)
                               Text("Back")
                                   .font(.headline)
                                   .foregroundColor(.gray)
                           }
                       }
                       Spacer()
                   }
                   .padding()
                   
                   HStack {
                       
                       VStack(alignment: .leading) {
                           Text("Rearrange the following cards in order")
                               .font(.largeTitle)
                               .multilineTextAlignment(.center)
                               .bold()
                               .padding(.bottom)
                      
                       }
                       Spacer()
                   }
                   .padding()
                   Spacer()
                   HStack {
                       ForEach(0..<model.cards.count) { index in
                           CardViewGame1(card: model.cards[index], hiddenCardIDs: $model.hiddenCardIDs)
                               .onTapGesture {
                                   if !model.hiddenCardIDs.contains(model.cards[index].id) {
                                       model.selectedCardIndex = index
                                       model.hiddenCardIDs.insert(model.cards[index].id)
                                   }
                               }
                       }
                   }
                   Spacer()
                   
                   HStack {
                       ForEach(model.cardsToOrder.indices, id: \.self) { index in
                           CardsOrderView(card: model.cardsToOrder[index])
                               .id(UUID())
                               .onTapGesture {
                                   if let selectedToOrderIndex = model.selectedCardToOrderIndex {
                                       let selectedCardToOrder = model.cardsToOrder[selectedToOrderIndex]
                                       if selectedCardToOrder.imageName != "" {
                                           model.resetCardToOrderImage(at: selectedToOrderIndex)
                                       }
                                   }
                                   model.selectedCardToOrderIndex = index
                                   model.replaceCardImage()
                                   model.cardsToOrder = model.cardsToOrder
                               }
                       }
                   }
                   Spacer()
                   
                   if model.allCardsPlaced {
                       Button {
                           // Handle Finish button action
                       } label: {
                           ZStack {
                               Rectangle()
                                   .foregroundColor(.blue)
                                   .frame(width: 250, height: 70)
                               Text("FINISH")
                                   .font(.body)
                                   .foregroundColor(.white)
                           }
                       }
                   }
               }
           }
       }
   }

   struct Game1View_Previews: PreviewProvider {
       static var previews: some View {
           Game1View()
       }
   }
//--------------------------
//func loadCombinationsFromJSON() -> [[Card1]] {
//    if let url = Bundle.main.url(forResource: "Game2", withExtension: "geojson"),
//       let data = try? Data(contentsOf: url) {
//        let decoder = JSONDecoder()
//        if let combinations = try? decoder.decode([[Card1]].self, from: data) {
//            return combinations.map { combination in
//                combination.map { Card1(correctIndex: $0.correctIndex, imageName: $0.imageName) }
//            }
//        }
//    }
//    return []
//}
//func restartGame() {
//    progress = 0
//
//    // Load combinations from JSON
//    let combinations = loadCombinationsFromJSON()
//
//    // Shuffle and assign the drag cards
//    if let firstCombination = combinations.first {
//        cardsToDrag = firstCombination.shuffled()
//    }
//
////        // Assign the drop cards
////        if let firstCombination = combinations.first {
////            cardsToDrop = firstCombination
////        }
//
//    cardsToDrop = cardsToDrag.map { Card1(correctIndex: $0.correctIndex, imageName: "") }
//}
