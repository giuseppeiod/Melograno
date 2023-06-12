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



let faceDownCard = CardMemory(imageName: " ")
