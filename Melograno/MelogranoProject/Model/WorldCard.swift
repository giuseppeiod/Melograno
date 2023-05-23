//
//  WorldCard.swift
//  MelogranoProject
//
//  Created by Giuseppe Iodice on 22/05/23.
//

import SwiftUI

import SwiftUI


struct WorldCard: Identifiable, Equatable, Codable {
    let id: Int
    let text: String
    var imageName: String
    var isHidden: Bool = false
    
    static func == (lhs: WorldCard, rhs: WorldCard) -> Bool {
        return lhs.id == rhs.id && lhs.text == rhs.text
    }
}
