//
//  BoardingSecond.swift
//  MelogranoProject
//
//  Created by Francesco on 06/06/23.
//


import SwiftUI

struct BoardingSecond: View {
    @State private var isShowingModal = false
    
    var body: some View {
        ZStack {
            OnBoardingFirst()
            
            if isShowingModal {
                Modale()
                    .transition(.move(edge: .bottom)) // Aggiungi l'animazione di transizione
                    .animation(.easeInOut(duration: 1)) // Imposta la durata dell'animazione
                    
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation(.easeInOut(duration: 1)) {
                    isShowingModal = true
                }
            }
        }
    }
}

struct BoardingSecond_Previews: PreviewProvider {
    static var previews: some View {
        BoardingSecond()
    }
}
