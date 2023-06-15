//
//  Game.swift
//  MelogranoProject
//
//  Created by Rita Marrano on 30/05/23.
//

import Foundation



struct Game: Identifiable {
    var id:UUID = UUID()
    
    var gameName:String
    var gameDescription:String
    var gameImage:String
    var gameType:Games

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
