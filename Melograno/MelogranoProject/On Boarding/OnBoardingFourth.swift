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
    @State private var key: String = ""

    var body: some View {
        VStack(spacing: 50) {
            Image("Welcome")
                .resizable()
                .scaledToFit()
                .frame(height: 50)
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : -40)
                .animation(.easeOut(duration: 1), value: isAnimating)

            Text("Insert your key")
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()
            
            Text("The once your doctor provided to you")
                .font(.body)
                .fontWeight(.light)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .padding()
            
            TextField("Enter key", text: $key)
                .padding()
                .frame(width: 240, height: 50)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .padding(.bottom, 20)
                .onChange(of: key) { newValue in
                    isOnboardingComplete = newValue.count == 8
                }

//            Button(action: {
//                isOnboardingComplete = true
//            }) {
//                Text("START")
//                    .font(.title)
//                    .foregroundColor(.white)
//                    .fontWeight(.bold)
//                    .frame(width: 360, height: 65)
//            }
//            .background(
//                Capsule().fill(Color.green)
//            )
//            .cornerRadius(20)
//            .opacity(isAnimating ? 1 : 0)
//            .offset(y: isAnimating ? 0 : 40)
//            .animation(.easeOut(duration: 1), value: isAnimating)
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
