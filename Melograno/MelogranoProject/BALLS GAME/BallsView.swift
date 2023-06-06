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
    
    
    @State var transY: CGFloat = 0
    @State var hrect: CGFloat = 20
    @State var transRect: CGFloat = 0
    
    @Binding var isHighlighted: Bool
    var color: Color
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Circle()
                    .foregroundColor(.black)
                    .frame(width: 100)
            }
            
            VStack {
                Spacer()
                Rectangle()
                    .foregroundColor(.black)
                    .frame(width: 100, height: hrect)
                    .offset(x: 0, y: transRect)
                Spacer()
            }
            
            VStack {
                Circle()
                    .foregroundColor(isHighlighted ? color : color)
                    .frame(width: 100)
                    .offset(x: 0, y: transY)
            }
        }
        .frame(width: 100, height: 120)
        .onChange(of: isHighlighted) { newValue in
            if newValue {
                animate()
            } else {
                stopAnimation()
            }
        }
        .onAppear {
            stopAnimation()
        }
    }
    
    func animate() {
        withAnimation {
            transY = 13
            hrect = 1
            transRect = 7
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            withAnimation(.linear(duration: 1.0)) {
                transY = 0
                hrect = 20
                transRect = 0
            }
        }
    }
    
    func stopAnimation() {
        transY = 0
        hrect = 20
        transRect = 0
    }
}


//struct BallsView_Previews: PreviewProvider {
//    @State static var isHighlighted = false
//    
//    static var previews: some View {
//        BallsView(isHighlighted: $isHighlighted, color: .blue)
//            .padding()
//            .previewLayout(.sizeThatFits)
//    }
//}
