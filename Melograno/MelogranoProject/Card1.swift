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
        aCoder.encode(correctIndex, forKey: "indiceCorretto")
    }
}

