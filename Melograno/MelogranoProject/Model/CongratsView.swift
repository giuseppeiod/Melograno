//
//  CongratsView.swift
//  MelogranoProject
//
//  Created by Rita Marrano on 12/06/23.
//

import SwiftUI

struct CongratsView: View {
    
    var dismiss: () -> Void
    var replay: () -> Void
    var points: Int
    var result: Int
    var gameType:Games = .association
    var body: some View {
        ZStack{
            Image("congrats")
            
            VStack{
                Text("CONGRATULATIONS,\nYOU COMPLETED THE LEVEL!")
                    .multilineTextAlignment(.center)
                    .font(.custom("Figtree-ExtraBold", size: dynamicWidth(48)))
                    .foregroundColor(.black)
                    .padding(.top, dynamicHeight(80))
                Spacer()
                if gameType == .balls{
                    Text("You have got a sequence of \(points) !")
                        .font(.custom("Figtree-Medium", size: dynamicWidth(40)))
                }else if gameType == .association || gameType == .cronological{
                    Text("You have done \(points-result) mistakes.")
                        .font(.custom("Figtree-Medium", size: dynamicWidth(40)))
                }else{
                    Text("")
                }
                Spacer()
                HStack{
                    Button(action: {
                        dismiss()
                    }, label: {
                        FinishButtonView(buttonText: "Levels")
                    })
                    .padding(.bottom, dynamicHeight(80))
                    .padding(.horizontal,50)
                    
                    Button(action: {
                        replay()
                    }, label: {
                        FinishButtonView(buttonText: "Replay")
                    })
                    .padding(.bottom, dynamicHeight(80))
                    .padding(.horizontal,50)
                    
                }
            }.frame(width: dynamicWidth(903), height: dynamicHeight(543))
        }
        .frame(width: dynamicWidth(903), height: dynamicHeight(543))
        .background(Color.white)
        .cornerRadius(dynamicWidth(50))
        .transition(.combined(.scale)(with: .opacity))
    }
}

struct CongratsView_Previews: PreviewProvider {
    static var previews: some View {
        CongratsView(dismiss: {}, replay: {}, points: 0, result: 0)
    }
}
