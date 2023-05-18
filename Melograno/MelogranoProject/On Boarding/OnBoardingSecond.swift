//
//  OnBoardingSecond.swift
//  MelogranoProject
//
//  Created by Giuseppe Iodice on 15/05/23.
//

import SwiftUI

import SwiftUI

struct OnBoardingSecond: View {
    
    var body: some View {
        
        VStack (alignment: .center) {
            Spacer()
            Image("gallinaim")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            
            Text("Take care you")
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()
            
            Text("Follow your doctor instructions")
                .font(.body)
                .fontWeight(.light)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .padding()
            
            Spacer()
            
        } //: VStack
    }
}


struct OnBoardingSecond_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingSecond()
    }
}
