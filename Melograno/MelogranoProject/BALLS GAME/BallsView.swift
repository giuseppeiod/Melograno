//
//  BallsView.swift
//  MelogranoProject
//
//  Created by Rita Marrano on 16/05/23.
//

import SwiftUI

//struct BallsView: View {
//
//    @Binding var isHighlighted: Bool
//    var color: Color
//
//
//
//    var body: some View {
//
//       Circle()
//            .fill(color)
//            .frame(width: 150, height: 150)
//            .opacity(isHighlighted ? 1.0 : 0.2)
//            .animation(.default)
//    }
//}



struct BallsView: View {
    @Binding var isHighlighted: Bool
    var color: Color
    
    var body: some View {
        ZStack {
            Circle()
                .fill(color.opacity(0.6))
                .frame(width: 150, height: 150)
            
            Circle()
                .fill(color)
                .frame(width: 150, height: 150)
                .offset(y: isHighlighted ? -25 : 0)
                .animation(.spring())
        }
        
        .shadow(radius: isHighlighted ? 25 : 0)
    }
}



struct BallsView_Previews: PreviewProvider {
    @State static var isHighlighted = false
    
    static var previews: some View {
        BallsView(isHighlighted: $isHighlighted, color: .blue)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
