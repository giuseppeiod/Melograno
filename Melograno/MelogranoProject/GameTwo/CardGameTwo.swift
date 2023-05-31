//
//  CardGameTwo.swift
//  MelogranoProject
//
//  Created by Giuseppe Iodice on 31/05/23.
//

import SwiftUI

struct CardGameTwo: Identifiable, Equatable, Decodable {
    let id: Int
    var imageName: String
    var isHidden: Bool = false
    var isBlurred: Bool = false
    
    // Equatable conformance
    static func == (lhs: CardGameTwo, rhs: CardGameTwo) -> Bool {
        return lhs.id == rhs.id
            && lhs.imageName == rhs.imageName
            && lhs.isHidden == rhs.isHidden
            && lhs.isBlurred == rhs.isBlurred
    }
    
    // Decodable conformance
    enum CodingKeys: String, CodingKey {
        case id
        case imageName
        case isHidden
        case isBlurred
    }
}

