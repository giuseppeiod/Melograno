//
//  OnBoardingFirst.swift
//  MelogranoProject
//
//  Created by Giuseppe Iodice on 15/05/23.
//

import SwiftUI

struct OnBoardingFirst: View {
    @State private var isShowingModale = false

    var body: some View {

        ZStack{ Image("sfondo1")
                .resizable()
                .ignoresSafeArea()
            Text("GRANDE ICONA")
                .colorInvert()
                .font(.largeTitle)
                .fontWeight(.bold)
                .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                    isShowingModale = true
                                }
        }
        .sheet(isPresented: $isShowingModale) {
            Modale()
        }


    }
}


    struct OnBoardingFrist_Previews: PreviewProvider {

        static var previews: some View {

            OnBoardingFirst()
        }
    }
}
