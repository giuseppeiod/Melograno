//
//  BallsView.swift
//  MelogranoProject
//
//  Created by Rita Marrano on 16/05/23.
//

import SwiftUI

struct BallsView: View {
    
    @State var transY: CGFloat = dynamicHeight(0)
    @State var hrect: CGFloat = dynamicHeight(30)
    @State var transRect: CGFloat = dynamicHeight(0)
    
    @Binding var isHighlighted: Bool
    @State var color: ColoreBottone
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Circle()
                    .foregroundColor(color.coloresotto)
                    .frame(width: dynamicHeight(250))
            }
            
            VStack {
                Spacer()
                Rectangle()
                    .foregroundColor(color.coloresotto)
                    .frame(width: dynamicHeight(250), height: hrect)
                    .offset(x: 0, y: transRect)
                Spacer()
            }
            
            VStack {
                Circle()
                    .foregroundColor(isHighlighted ? color.coloreop : color.coloresopra)
                    .frame(width: dynamicHeight(250))
                    .offset(x: 0, y: transY)
                Spacer()
            }
        }
        .frame(width: dynamicWidth(250), height: dynamicHeight(280))
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
            isHighlighted = true
            transY = dynamicHeight(20)
            hrect = dynamicHeight(1)
            transRect = dynamicHeight(7)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) {
            withAnimation(.linear(duration: 1.0)) {
                isHighlighted = false
                transY = dynamicHeight(0)
                hrect = dynamicHeight(30)
                transRect = dynamicHeight(0)
            }
        }
    }
    
    func stopAnimation() {
        transY = dynamicHeight(0)
        hrect = dynamicHeight(30)
        transRect = dynamicHeight(0)
    }
}


struct BallsView_Previews: PreviewProvider {
    @State static var isHighlighted = false
    
    static var previews: some View {
        BallsView(isHighlighted: $isHighlighted, color:ColoreBottone(coloresopra: .blue, coloredopo: .blue, coloresotto: .red, coloreop: .yellow, suono: "a"))
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
