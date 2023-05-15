//
//  GameButton.swift
//  MelogranoProject
//
//  Created by Giuseppe Iodice on 15/05/23.
//



import SwiftUI

struct GameButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title)
                .foregroundColor(.white)
                .frame(width: 120, height: 120)
                .background(Color.blue)
                .cornerRadius(10)
        }
    }
}


