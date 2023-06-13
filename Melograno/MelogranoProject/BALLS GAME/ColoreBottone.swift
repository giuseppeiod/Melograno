//
//  ColoreBottone.swift
//  MelogranoProject
//
//  Created by Rita Marrano on 11/06/23.
//

import SwiftUI

struct ColoreBottone : Identifiable{

    var id = UUID()
    @State var coloresopra : Color
    @State var coloredopo : Color
    var coloresotto : Color
    @State var coloreop : Color
    var suono : String

    func cambio() {
        coloresopra = coloreop
    }

}

