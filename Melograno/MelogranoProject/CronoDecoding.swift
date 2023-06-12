//
//  CronoDecoding.swift
//  MelogranoProject
//
//  Created by Rita Marrano on 12/06/23.
//

import Foundation


struct CronoDecoding : Codable {
    var id : Int
    var correctIndex : Int
    var imageName : String
    var isHidden : Bool
    var isBlurred : Bool
}


func load<T: Decodable>(type:String) -> T {

    let data: Data

    guard let file = Bundle.main.url(forResource: type, withExtension: "json")
        else {
            fatalError("Couldn't find in main bundle.")

    }
    do {
        data = try Data(contentsOf: file)

    } catch {
        fatalError("Couldn't load from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse as \(T.self):\n\(error)")
    }
}
