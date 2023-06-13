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


        ZStack{
            VStack{
                Text("Welcome to B.T. Hub")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 20.0)
                
                Text("Free activity")
                    .fontWeight(.bold)
                    .padding()
                
                HStack {
                    Image(systemName: "dumbbell.fill")
                    Text("Train and strengthen your cognitive \n skills \n with stimulating and fun activities!")
                }
                .padding()
                
                HStack{
                    Image(systemName: "point.topleft.down.curvedto.point.filled.bottomright.up")
                    Text("You will find many activities that \n stimulate different cognitive areas:\n this way you will keep your mind 100\n percent active.")
                }
                .padding()
                
                HStack{
                    Image(systemName: "circle.grid.3x3.fill")
                    Text("If you want a personalized path, ask \n for the support of an expert who will\n be able to structure the one best\n suited for you.")
                }
                .padding()


          
            .background(Color.white)
            .cornerRadius(20)
            
            
         Rectangle()
                    .frame(width: 447, height: 65)
                    .cornerRadius(20)
                    .foregroundColor(Color("CustomPurple"))
                    .overlay(
                    Text("Explore"))
                    .font(.custom("Figtree-Medium", size: 48))
                    .foregroundColor(.white)
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
