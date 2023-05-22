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
        
        if isGameFinishedButton{
            ContentView()
        }else{
        VStack {
            
            
            
            Button(action: {
                
                isGameFinishedButton = true
                
                print("Button pressed")
                
                
            }) {
                Image(systemName: "xmark")
                    .font(.title)
                    .foregroundColor(.gray)
            }

            
            
            
            HStack {
                ForEach(model.cards, id: \.id) { card in
                    CardViewGame1(card: card, hiddenCardIDs: $model.hiddenCardIDs)
                        .onTapGesture {
                            if !model.hiddenCardIDs.contains(card.id) {
                                model.selectedCardIndex = card.id
                                model.hiddenCardIDs.insert(card.id)
                            }
                        }
                }
            }
            
            
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
            
            
            if model.allCardsPlaced {

                            Button {
                                //
                            } label: {

                                ZStack{

                                    Rectangle()
                                        .foregroundColor(.blue)
                                        .frame(width: 150, height: 30)


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
