//
//  OnBoardingThird.swift
//  MelogranoProject
//
//  Created by Giuseppe Iodice on 15/05/23.
//

import SwiftUI

import SwiftUI

struct OnBoardingThird: View {
    
    var body: some View {
      
        VStack (alignment: .center) {
            
            Image("w3")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            
            Text("Take care of your mind")
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()
            
            Text("Let's exercise in a safe place")
                .font(.body)
                .fontWeight(.light)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .padding()
            
        } //: VStack
    }
}

struct OnBoardingThird_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingThird()
    }
}
