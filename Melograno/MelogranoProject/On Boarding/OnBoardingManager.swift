//
//  OnBoardingManager.swift
//  MelogranoProject
//
//  Created by Giuseppe Iodice on 15/05/23.
//

import SwiftUI

struct OnBoardingManager: View {
    @AppStorage("onboardingViewShown")
    var onboardingViewShown: Bool = false
    
    @State private var currentPageIndex = 0
    
    var body: some View {
        VStack {
            TabView(selection: $currentPageIndex) {
                OnBoardingFirst()
                    .tag(0)
                
                OnBoardingSecond()
                    .tag(1)
                
                OnBoardingThird()
                    .tag(2)
                
                WelcomeView()
                    .tag(3)
            }
            .ignoresSafeArea()
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            
            HStack {
                Spacer()
                
                PageControl(numberOfPages: 4, currentPage: $currentPageIndex)
                    .padding(.trailing)
            }
        }
        .onAppear(perform: {
            UserDefaults.standard.onboardingViewShown = true
        })
    }
}

struct OnBoardingManager_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingManager()
    }
}
