//
//  Card2.swift
//  MelogranoProject
//
//  Created by Giuseppe Iodice on 22/05/23.
//

import SwiftUI

import Foundation
import SwiftUI

struct Card2: Identifiable, Equatable {
    let id: Int
    var imageName: String
    var isHidden: Bool = false
    
   
    static func == (lhs: Card2, rhs: Card2) -> Bool {
        return lhs.id == rhs.id && lhs.imageName == rhs.imageName
    }
}

