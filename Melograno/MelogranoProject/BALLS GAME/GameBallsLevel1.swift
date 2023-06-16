//
//  GameBallsLevel1.swift
//  MelogranoProject
//
//  Created by Rita Marrano on 10/06/23.
//

import SwiftUI

struct GameBallsLevel1: View {
    
    @State var showPopup : Bool = false
    
    
    @StateObject private var model: BallsModel
    @State var showOpacity : Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    init(circlesNumber:Int, bottoni:Binding<[ColoreBottone]>) {
        _model = StateObject(wrappedValue: BallsModel.withNumberOfCircles(circlesNumber)) // Imposta il numero di cerchi desiderato
        self._bottoni = bottoni
    }
    
    
    
    let columns = [
        GridItem(.flexible(), alignment: .center),
            GridItem(.flexible(), alignment: .center),
            GridItem(.flexible(), alignment: .center)
        ]
    
    @Binding var bottoni: [ColoreBottone]
    var body: some View {
        
        
        
        ZStack(){
            
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
                    if bottoni.count == 5{
                        
                        VStack{
                            HStack(spacing:dynamicWidth(75)){
                                ForEach(0..<3) { index in
                                    BallsView(isHighlighted: $model.highlight[index], color: bottoni[index])
                                        .onTapGesture {
                                            if !model.isAnimating && model.isPlayerTurn {
                                                
                                                model.circleTapped(bottoni[index].name)
                                                model.provideHapticFeedback()
                                            }
                                        }
                                        .simultaneousGesture(
                                            TapGesture().onEnded { _ in
                                                model.playSound(for: bottoni[index].name)
                                            }
                                        ).disabled(!model.isPlayerTurn)
                                }
                            }
                            HStack(spacing:dynamicWidth(75)){
                                ForEach(3..<5) { index in
                                    BallsView(isHighlighted: $model.highlight[index], color: bottoni[index])
                                        .onTapGesture {
                                            if !model.isAnimating && model.isPlayerTurn {
                                                
                                                model.circleTapped(bottoni[index].name)
                                                model.provideHapticFeedback()
                                            }
                                        }
                                        .simultaneousGesture(
                                            TapGesture().onEnded { _ in
                                                model.playSound(for: bottoni[index].name)
                                            }
                                        ).disabled(!model.isPlayerTurn)
                                }
                            }
                        }
                    }
                    else
                    {
                        ForEach(Array(bottoni.enumerated()), id: \.offset) { index, element in
                            BallsView(isHighlighted: $model.highlight[index], color: element)
                                .onTapGesture {
                                    if !model.isAnimating && model.isPlayerTurn {
                                        
                                        model.circleTapped(element.name)
                                        model.provideHapticFeedback()
                                    }
                                }
                                .simultaneousGesture(
                                    TapGesture().onEnded { _ in
                                        print(element.name)
                                        model.playSound(for: element.name)
                                    }
                                ).disabled(!model.isPlayerTurn)
                        }
                    }
                }.onAppear(perform: model.animateCircles)
                    .onDisappear {
                        model.audioPlayer?.stop()
                        model.isViewVisible = false
                    }
            }
            .padding(.top,dynamicHeight(150))
            .navigationBarBackButtonHidden(model.isGameFinished)
            .onChange(of: model.isGameFinished, perform: {_ in
                if model.isGameFinished{
                    withAnimation{
                        showOpacity = true
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        withAnimation(.linear(duration: 0.3)){
                            showPopup = true
                        }
                    }
                }
            })
            
            
            
            if showOpacity{
                    Color.black.opacity(0.8).ignoresSafeArea()
                    if model.isGameFinished == true {
                        CongratsView(dismiss: {
                            presentationMode.wrappedValue.dismiss()
                        }, replay: {
                            model.restartGame()
                            model.animateCircles()
                            showOpacity = false
                            showPopup = false
                        }, points: model.points, result: model.currentSequenceIndex,gameType: .balls)
                    }
                }
            }
        }
    }



struct GameBallsLevel1_Previews: PreviewProvider {
    static var previews: some View {
        GameBallsLevel1(circlesNumber: 3, bottoni: .constant([]))
    }
}
