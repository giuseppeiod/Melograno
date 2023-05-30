//
//  Game.swift
//  MelogranoProject
//
//  Created by Rita Marrano on 30/05/23.
//

import Foundation

struct Game: Identifiable, Hashable {
    let id: Int
    let title: String
    let image: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func ==(lhs: Game, rhs: Game) -> Bool {
        return lhs.id == rhs.id
    }
}
