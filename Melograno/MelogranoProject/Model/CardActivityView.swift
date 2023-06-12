//
//  CardActivityView.swift
//  MelogranoProject
//
//  Created by Rita Marrano on 12/06/23.
//

import SwiftUI

struct CardActivityView: View {
    
    var game:Game
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: dynamicWidth(40))
                .foregroundColor(Color("violaApp"))
                
            
            VStack(spacing: 0){
                Image(game.image)
                    .resizable()
                    .cornerRadius(dynamicWidth(40))
                    .frame(width: dynamicWidth(256), height: dynamicHeight(217))
                Spacer()
                Text(game.name)
                    .font(.system(size: 33))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                Spacer()
                
            }
            .frame(width: dynamicWidth(256), height: dynamicHeight(297))
            
            
        }.overlay(
            RoundedRectangle(cornerRadius: dynamicWidth(40))
                .stroke(Color("violaApp"), lineWidth: 5))
        .frame(width: dynamicWidth(256), height: dynamicHeight(297))
    }
}
