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
    var coloredopo : Color
    var coloresotto : Color
    var coloreop : Color
    var suono : String

    func cambio() {
        coloresopra = coloreop
        print("aaa")
    }

}
//struct ColoreBottone_Previews: PreviewProvider {
//    static var previews: some View {
//        ColoreBottone(coloresopra: .red, coloredopo: .blue, coloresotto: .black, coloreop: .purple, suono: "a")
//    }
//}
