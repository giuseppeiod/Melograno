//
//  OnBoardingFirst.swift
//  MelogranoProject
//
//  Created by Giuseppe Iodice on 15/05/23.
//

import SwiftUI

struct OnBoardingFirst: View {
   
    var body: some View {
        
        VStack (alignment: .center) {
            
            Image("w3")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            
            Text("Your care matters!")
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()
            
            Text("Stay tuned with your doctor")
                .font(.body)
                .fontWeight(.light)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .padding()
            
        } //: VStack
    }
}

struct OnBoardingFrist_Previews: PreviewProvider {
    
    static var previews: some View {
        
        OnBoardingFirst()
    }
}
