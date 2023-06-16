//
//  LevelButtonView.swift
//  MelogranoProject
//
//  Created by Tullio Boccardo on 16/06/23.
//

import SwiftUI

struct LevelButtonView: View {
    var buttonText : String
    
    var body: some View {
        HStack{
            Text(buttonText)
                .foregroundColor(.white)
                .font(.custom("Figtree-SemiBold", size: dynamicWidth(40)))
        }
        .frame(width: dynamicWidth(256), height: dynamicHeight(67))
        .background(Color("violaApp"))
        .cornerRadius(dynamicWidth(40))
    }
}

struct LevelButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LevelButtonView(buttonText: "Level")
    }
}
