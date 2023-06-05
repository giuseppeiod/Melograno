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
    
    
    var body: some View {
        
        
            ZStack {
                
                
                OnBoardingFourth()
                
                
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
