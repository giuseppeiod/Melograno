//
//  Game.swift
//  MelogranoProject
//
//  Created by Rita Marrano on 30/05/23.
//

import Foundation



struct Game:Identifiable {
    var name:String
    var description:String
    var image:String
    var id:UUID = UUID()
    var type:Games
}

enum Games {
case association
case cronological
case memory
case balls
}

enum Level : String, CaseIterable{
    case level1 = "Level 1"
    case level2 = "Level 2"
    case level3 = "Level 3"
}
