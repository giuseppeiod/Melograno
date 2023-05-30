//
//  CardGame1.swift
//  MelogranoProject
//
//  Created by Rita Marrano on 30/05/23.
//

import Foundation
import SwiftUI

struct CardGameOne: Identifiable, Equatable, Decodable {
    let id: Int
    let correctIndex: Int
    var imageName: String
    var isHidden: Bool = false
    var isBlurred: Bool = false
    
    // Equatable conformance
    static func == (lhs: CardGameOne, rhs: CardGameOne) -> Bool {
        return lhs.id == rhs.id
            && lhs.correctIndex == rhs.correctIndex
            && lhs.imageName == rhs.imageName
            && lhs.isHidden == rhs.isHidden
            && lhs.isBlurred == rhs.isBlurred
    }
    
    // Decodable conformance
    enum CodingKeys: String, CodingKey {
        case id
        case correctIndex
        case imageName
        case isHidden
        case isBlurred
    }
}
