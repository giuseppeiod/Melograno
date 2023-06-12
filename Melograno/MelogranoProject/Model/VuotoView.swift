//
//  VuotoView.swift
//  MelogranoProject
//
//  Created by Rita Marrano on 12/06/23.
//

import SwiftUI



struct VuotoView: View {
    
    var size: CGFloat = dynamicWidth(260)
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: dynamicWidth(40))
                .foregroundColor(Color("violaApp"))
                .opacity(0.0000000001)
                .frame(width: size, height: size)
        }.overlay(
            RoundedRectangle(cornerRadius: dynamicWidth(40))
                .stroke(Color("violaApp"), lineWidth: 5))
        .frame(width: size, height: size)
    }
}

struct VuotoView_Previews: PreviewProvider {
    static var previews: some View {
        VuotoView()
    }
}

