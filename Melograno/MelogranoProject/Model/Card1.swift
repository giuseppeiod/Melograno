//
//  Card1.swift
//  MelogranoProject
//
//  Created by Giuseppe Iodice on 15/05/23.
//

import SwiftUI
import Foundation

class Card1: NSObject, NSSecureCoding, Identifiable, Codable {
    
    let correctIndex: String
    var imageName: String
    
    static var supportsSecureCoding: Bool {
        return true
    }
    
    init(correctIndex: String, imageName: String) {
        
        self.correctIndex = correctIndex
        self.imageName = imageName
    }
    
    required init?(coder aDecoder: NSCoder) {
        guard let imageName = aDecoder.decodeObject(forKey: "imageName") as? String,
              let correctIndex = aDecoder.decodeObject(forKey: "correctIndex") as? String else {
            return nil
        }
        
        self.imageName = imageName
        self.correctIndex = correctIndex
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(imageName, forKey: "imageName")
        aCoder.encode(correctIndex, forKey: "correctIndex")
    }
    
    
    func loadCardsFromJSON() -> [Card1]? {
        if let url = Bundle.main.url(forResource: "Game2", withExtension: "geojson"),
           let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            do {
                let cardData = try decoder.decode([Card1].self, from: data)
                return cardData
            } catch {
                print("Error decoding cards: \(error)")
            }
        }
        return nil
    }
}

