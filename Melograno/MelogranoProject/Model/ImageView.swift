//
//  ImageView.swift
//  MelogranoProject
//
//  Created by Rita Marrano on 12/06/23.
//

import SwiftUI


struct ImageView: View {
    
    var image: String
    var size: CGFloat = dynamicWidth(256)
    
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFit()
            .cornerRadius(dynamicWidth(40))
           .frame(width: size, height: size)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(image: "")
    }
}
