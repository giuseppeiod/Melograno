//
//  GameBallsLevel2.swift
//  MelogranoProject
//
//  Created by Rita Marrano on 10/06/23.
//
import SwiftUI

struct GameBallsLevel2: View {
    

    @StateObject private var model: BallsModel
    
    
    init() {
        _model = StateObject(wrappedValue: BallsModel.withNumberOfCircles(4)) // Imposta il numero di cerchi desiderato
    }
    
    var bottoni: [ColoreBottone] = [
        
        ColoreBottone(coloresopra: .redOff, coloredopo: .redOff, coloresotto: .redDown, coloreop: .redOn, suono: "a"),
        
        ColoreBottone(coloresopra: .blueOff, coloredopo: .blueOff, coloresotto: .blueDown, coloreop: .blueOn, suono: "b"),
        
        ColoreBottone(coloresopra: .greenOff, coloredopo: .greenOff, coloresotto: .greenDown, coloreop: .greenOn, suono: "c"),
        
        ColoreBottone(coloresopra: .yellowOff, coloredopo: .yellowOff, coloresotto: .yellowDown, coloreop: .yellowOn, suono: "d")
        
        
        
    ]
    var body: some View {
        
        ZStack{
            
            VStack(alignment: .leading){
                Text("BUTTONS")
                    .font(.custom("Figtree-ExtraBold", size: dynamicWidth(34)))
                
                Text("Repeat the sequence of the lighted buttons.")
                    .font(.custom("Figtree-Regular", size: dynamicWidth(32)))
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal,dynamicWidth(60))
            .padding(.top, dynamicHeight(83))
            .ignoresSafeArea()
            VStack{
                if !model.isAnimating && model.isPlayerTurn{
                    Text("Your turn!")
                        .font(.custom("Figtree-ExtraBold", size: dynamicWidth(32)))
                        .foregroundColor(.black)
                    Spacer()
                }
                
                
                Text(model.gameResult)
                    .font(.custom("Figtree-ExtraBold", size: dynamicWidth(32)))
                    .foregroundColor(.black)
                Spacer()
            }.padding(.top, dynamicHeight(150))
            
            
            
            
            VStack(spacing: 40){
                HStack(spacing: 60){
                    
                    BallsView(isHighlighted: $model.highlight[3], color: bottoni[3])
                        .onTapGesture {
                            if !model.isAnimating && model.isPlayerTurn {
                                model.circleTapped("p")
                                model.provideHapticFeedback()
                                model.playSoundeE()
                                
                            }
                        }   
                    BallsView(isHighlighted: $model.highlight[0], color: bottoni[0])
                        .onTapGesture {
                            if !model.isAnimating && model.isPlayerTurn {
                                model.circleTapped("r")
                                model.provideHapticFeedback()
                                model.playSoundA()
                            }
                        }

                }
                HStack(spacing: 60) {
                    
                    BallsView(isHighlighted: $model.highlight[1], color: bottoni[1])
                        .onTapGesture {
                            if !model.isAnimating && model.isPlayerTurn {
                                model.circleTapped("g")
                                model.provideHapticFeedback()
                                model.playSoundC()
                            }
                        }

                    
                    BallsView(isHighlighted: $model.highlight[2], color: bottoni[2])
                        .onTapGesture {
                            if !model.isAnimating && model.isPlayerTurn {
                                model.circleTapped("b")
                                model.provideHapticFeedback()
                                model.playSoundD()
                            }
                        }

                }
                
                
            }
            .padding(.top,dynamicHeight(200))
            
            
            if model.isGameFinished == true {

                            CongratsView(dismiss: {}, replay: {
                                model.restartGame()
                                model.animateCircles()
                            }, points: model.currentSequenceIndex, result: model.currentSequenceIndex)
                        }
        }
        .onAppear(perform: model.animateCircles)
        .onDisappear {
            model.audioPlayer?.stop()
            model.isViewVisible = false
        }
    }
}

struct GameBallsLevel2_Previews: PreviewProvider {
    static var previews: some View {
        GameBallsLevel2()
    }
}
