//
//  CardMemory.swift
//  MelogranoProject
//
//  Created by Giuseppe Iodice on 16/05/23.
//
import Foundation

class CardMemory: Identifiable, ObservableObject{
    
    let id = UUID()
    
    let imageName: String
    

    @Published var isFaceUp = false
    @Published var isMatched = false
    
    

    init(imageName: String) {
        self.imageName = imageName
        
    }
    
    func turnOver(){
       
        self.isFaceUp.toggle()
    }
    

}


let imagesName = ["uno", "due", "tre", "quattro"]
    .shuffled()
let faceDownCard = CardMemory(imageName: " ")


//extension CardMemory {
//    
//    static func createCardList() -> [CardMemory] {
//        let imagesName = ["uno", "due", "tre"]
//        
//        var cards = [CardMemory]()
//        for imageName in imagesName {
//            cards.append(CardMemory(imageName: imageName))
//            cards.append(CardMemory(imageName: imageName))
//        }
//        return cards.shuffled()
//    }
//}
