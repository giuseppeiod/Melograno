//
//  WordView.swift
//  MelogranoProject
//
//  Created by Rita Marrano on 12/06/23.
//

import SwiftUI

struct WordView: View {
    
    var name:String
    var spotimagesize: CGFloat = dynamicWidth(260)
    var hsize: CGFloat = dynamicHeight(320)
    var wordsize: CGFloat = dynamicWidth(32)
    var textframesize: CGFloat = dynamicHeight(60)
   
    
    var body: some View {
        VStack(spacing: 0){
            Rectangle()
                .frame(width: spotimagesize, height: spotimagesize)
                .foregroundColor(.white)
                
                Text(name)
                    .font(.custom("Figtree-Medium", size: wordsize))
                    .textCase(.uppercase)
                    .foregroundColor(.black)
                    .frame(height: textframesize)

        }
        .overlay(
            RoundedRectangle(cornerRadius: dynamicWidth(40))
                .stroke(Color("violaApp"), lineWidth: dynamicWidth(5)))
        .frame(width: spotimagesize, height: hsize)
    }
}

struct WordView_Previews: PreviewProvider {
    static var previews: some View {
        WordView(name: "")
    }
}
