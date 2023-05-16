//
//  BallsView.swift
//  MelogranoProject
//
//  Created by Rita Marrano on 16/05/23.
//

import SwiftUI

struct BallsView: View {
    
    @Binding var isHighlighted: Bool
    var color: Color
    
    
    
    var body: some View {
        
       Circle()
            .fill(color)
            .opacity(isHighlighted ? 1.0 : 0.2)
            .animation(.default)
    }
}

