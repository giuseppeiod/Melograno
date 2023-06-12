//
//  GameBallsLevel3.swift
//  MelogranoProject
//
//  Created by Rita Marrano on 10/06/23.
//

import SwiftUI

struct GameBallsLevel3: View {
    @StateObject private var model: BallsModel
    
    
    init() {
        _model = StateObject(wrappedValue: BallsModel.withNumberOfCircles(5)) // Imposta il numero di cerchi desiderato
    }
    
    
    var bottoni: [ColoreBottone] = [
        
        ColoreBottone(coloresopra: .red, coloredopo: .blue, coloresotto: .black, coloreop: .red, suono: "a"),
        
        ColoreBottone(coloresopra: .red, coloredopo: .blue, coloresotto: .black, coloreop: .red, suono: "a"),
        
        ColoreBottone(coloresopra: .red, coloredopo: .blue, coloresotto: .black, coloreop: .red, suono: "a"),
        
        ColoreBottone(coloresopra: .red, coloredopo: .blue, coloresotto: .black, coloreop: .red, suono: "a"),
        
        
        ColoreBottone(coloresopra: .red, coloredopo: .blue, coloresotto: .black, coloreop: .red, suono: "a")
    
    
    ]
    var body: some View {
        
        ZStack(){
            
            
            VStack(alignment: .leading){
                
                Text("Ballsathlon")
                    .font(.custom("Figtree-ExtraBold", size: 48))
                
                Text("Tap the balls sequence after they lit up ")
                    .font(.custom("Figtree-Regular", size: 48))
                
                
                Spacer()
                
                
            }
            
            VStack(){
                
                
                if !model.isAnimating && model.isPlayerTurn{
                    Text("Your turn!")
                        .font(.custom("Figtree-ExtraBold", size: 64))
                        .foregroundColor(Color("CustomPurple"))
                    
                }
                
                
                Text(model.gameResult)
                    .font(.custom("Figtree-ExtraBold", size: 64))
                    .foregroundColor(Color("CustomPurple"))
                
            }.padding(.bottom, 100)
            
            
            
            VStack(spacing: 40){
                Spacer()
                
                VStack(spacing: 40){
                    HStack(spacing: 60){
                        
                        BallsView(isHighlighted: $model.highlight[3], color: bottoni[3])
                            
                            .onTapGesture {
                                if !model.isAnimating && model.isPlayerTurn {
                                    model.circleTapped("p")
                                    model.provideHapticFeedback()

                                }
                            }                            .simultaneousGesture(
                                TapGesture().onEnded { _ in
                                    model.playSoundeE()
                                }
                            )
                        
                        
                        
                        BallsView(isHighlighted: $model.highlight[4], color: bottoni[4])
                            .onTapGesture {
                                if !model.isAnimating && model.isPlayerTurn {
                                    model.circleTapped("o")
                                    model.provideHapticFeedback()

                                }
                            }                            .simultaneousGesture(
                                TapGesture().onEnded { _ in
                                    model.playSoundeE()
                                }
                            )
                    }
                    
                    
                    
                    
                    
                    HStack(spacing: 60) {
                        
                        
                        
                        BallsView(isHighlighted: $model.highlight[0], color: bottoni[0])
                            .onTapGesture {
                                if !model.isAnimating && model.isPlayerTurn {
                                    model.circleTapped("r")
                                    model.provideHapticFeedback()

                                }
                            }
                            .simultaneousGesture(
                                TapGesture().onEnded { _ in
                                    model.playSoundA()
                                }
                            )
                        
                        BallsView(isHighlighted: $model.highlight[1], color: bottoni[1])
                            .onTapGesture {
                                if !model.isAnimating && model.isPlayerTurn {
                                    model.circleTapped("g")
                                    model.provideHapticFeedback()
                                }
                            }
                            .simultaneousGesture(
                                TapGesture().onEnded { _ in
                                    model.playSoundC()
                                }
                            )
                        
                        BallsView(isHighlighted: $model.highlight[2], color: bottoni[2])
                            .onTapGesture {
                                if !model.isAnimating && model.isPlayerTurn {
                                    model.circleTapped("b")
                                    model.provideHapticFeedback()

                                }
                            }
                            .simultaneousGesture(
                                TapGesture().onEnded { _ in
                                    model.playSoundD()
                                }
                            )
                    }
                    
                    
                }
            }.onAppear(perform: model.animateCircles)
            
            
            
            Spacer()
        }
    }
}

struct GameBallsLevel3_Previews: PreviewProvider {
    static var previews: some View {
        GameBallsLevel3()
    }
}
