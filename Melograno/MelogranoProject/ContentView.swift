//
//  ContentView.swift
//  MelogranoProject
//
//  Created by Giuseppe Iodice on 10/05/23.
//

import SwiftUI
import CoreData
import SpriteKit
import AVFoundation

extension UserDefaults {
    var onboardingViewShown: Bool{
        get {
            return (UserDefaults.standard.value(forKey: "onboardingViewShown")
                    as? Bool) ?? false
        }
        set {
            UserDefaults.standard.setValue(newValue , forKey: "onboardingViewShown")
        }
    }
}

struct ContentView: View {
    
    
    var body: some View {
        
        
            
            if UserDefaults.standard.onboardingViewShown  {
                
                StartMenu()
            } else {
                OnBoardingManager()
            }
        }
    
//        .navigationViewStyle(StackNavigationViewStyle())
    
}

struct ContentView1_Previews: PreviewProvider {

    static var previews: some View {

ContentView()
    }
}
