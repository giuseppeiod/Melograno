//
//  OnBoardingFourth.swift
//  MelogranoProject
//
//  Created by Giuseppe Iodice on 15/05/23.
//

import SwiftUI

struct OnBoardingFourth: View {
    @State private var isOnboardingComplete = false
    @State private var isAnimating: Bool = false
    @State private var name: String = ""

    var body: some View {
        
        VStack(spacing: 50) {
            
            Text("WELCOME")
                .font(.custom("customRegular", size: 46))
                .bold()
                .multilineTextAlignment(.center)
                .padding()
            

            Text("Insert your name")
                .font(.custom("customCorsivo", size: 36))
                .multilineTextAlignment(.center)
                .padding()
            
            
            TextField("Enter name", text: $name)
                .padding()
                .frame(width: 290, height: 50)
                .background(Color.purple.opacity(0.7))
                .cornerRadius(10)
                
//                .onChange(of: key) { newValue in
//                    isOnboardingComplete = newValue.count == 3
//                }


            Button {
                UserDefaults.standard.set(name, forKey: "userName")
                isOnboardingComplete = true
            } label: {
                Text("Start")
                    .font(.largeTitle)
                    .foregroundColor(.black)
            }

            
            
            .fullScreenCover(isPresented: $isOnboardingComplete) {
                ContentView()
            }
        }
        .onAppear {
            withAnimation(.easeIn(duration: 2)) {
                isAnimating = true
            }
        }
    }
}


struct OnBoardingFourth_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingFourth()
    }
}
