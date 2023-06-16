//
//  Menu.swift
//  MelogranoProject
//
//  Created by Tullio Boccardo on 12/06/23.
//

import SwiftUI


struct Menu: View {

    
  
    
    
    @AppStorage("onboardingViewShown")
    var onboardingViewShown: Bool = true
    
    @Environment(\.presentationMode) var presentationMode
    
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    let games:[Game] = [Game(gameName: "ASSOCIATE",gameDescription: "Associate the picture with the corresponding word.", gameImage: "associate", gameType: .association),Game(gameName: "TIME ORDER", gameDescription: "Put the following images in chronological order.", gameImage: "cronological", gameType: .cronological),Game(gameName: "MEMORY", gameDescription: "Match the pairs of the same pictures.", gameImage: "memory", gameType: .memory),Game(gameName: "BUTTONS", gameDescription: "Repeat the sequence of the lighted buttons.", gameImage: "balls", gameType: .balls)]
    
    @State var aa: Bool = true
    
    var body: some View {
        NavigationView(){
            ZStack{
            
                VStack(alignment:.leading){
                    HStack{
                        Text("Welcome")
                            .font(.custom("Figtree-ExtraBold", size: dynamicWidth(64)))
                            .foregroundColor(.white)
                            .padding(.horizontal,dynamicWidth(32))
                            .padding(.top,dynamicHeight(55))
                        Spacer()
                    }
                    .ignoresSafeArea()
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            
                            ForEach(games) { item in
                                NavigationLink(destination: LevelView(game: item), label: {
                                    CardActivityView(game: item)
                                        .padding(.vertical,15)
                                })
                                
                                
                            }
                        }
                        .padding(.horizontal)
                    }
                    .ignoresSafeArea()
                    .padding(.top,100)
                    
                }.background(Image("background")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .scaledToFill())
                
                
                if  onboardingViewShown {
                   
                        Image("onbbackground")
                            .resizable()
                        
                            .scaledToFill()
                        
                     
                    
                }
            }
            .ignoresSafeArea()
           
                
        }
        .preferredColorScheme(.light)
        .navigationViewStyle(.stack)
        .sheet(isPresented: Binding(
            get: { onboardingViewShown },
            set: { _ in UserDefaults.standard.setValue(aa , forKey: "onboardingViewShown") }
        ), onDismiss: {onboardingViewShown = false} ) {
            
            
            //MARK: onboarding
//
//            VStack(spacing: 25){
          Spacer()
                Text("Welcome to B.T. Hub")
                    .font(.custom("Figtree-ExtraBold", size: dynamicWidth(48)))
            
//                    .padding(.top, 10.0)
//                    .frame(minWidth: 0, maxWidth: .infinity)
                
                  //  .padding()
            Spacer()
            VStack(spacing: 25){
                
                
                HStack(spacing: 30){
                    Image(systemName: "dumbbell.fill")
                        .resizable()
                        .frame(width: dynamicWidth(77), height: dynamicHeight(41))
                    
                    
                    VStack {
                        HStack{
                            Text("Free activity")
                                .font(.custom("Figtree-ExtraBold", size: dynamicWidth(24)))
                            Spacer()
                        }
                        HStack{
                            Text("Train and strengthen your  cognitive \n skills  with stimulating and funny \n activities!")
                                .font(.custom("Figtree-Medium", size: dynamicWidth(20)))
                            Spacer()
                        }
                    }
                }
                .frame(width: dynamicWidth(500))
                
                HStack(spacing: 40){
                    Image(systemName: "circle.grid.3x3.fill")
                        .resizable()
                        .frame(width: dynamicWidth(61), height: dynamicHeight(61))
                    
                    
                    VStack {
                        HStack{
                            Text("Varieties")
                                .font(.custom("Figtree-ExtraBold", size: dynamicWidth(24)))
                            Spacer()
                        }
                        HStack{
                            Text("You will find many activities that \n stimulate different cognitive areas:\n this way you will keep your mind 100\n percent active.")
                                .font(.custom("Figtree-Medium", size: dynamicWidth(20)))
                            Spacer()
                        }
                    }
                }
                
                .frame(width: dynamicWidth(480))
                
                
                HStack(spacing: 45){
                    Image(systemName: "point.topleft.down.curvedto.point.filled.bottomright.up")
                        .resizable()
                        .frame(width: dynamicWidth(54), height: dynamicHeight(54))
                    
                    
                    VStack {
                        HStack{
                            Text("Customized pathway")
                                .font(.custom("Figtree-ExtraBold", size: dynamicWidth(24)))
                            Spacer()
                        }
                        HStack{
                            Text("If you want a personalized path, ask \n for the support of an expert who will\n be able to structure the one best\n suited for you.")
                                .font(.custom("Figtree-Medium", size: dynamicWidth(20)))
                            Spacer()
                        }
                    }
                }
                
                .frame(width: dynamicWidth(480))
                
                
            
            }
        Spacer()
        
                Rectangle()
                    .frame(width: 447, height: 65)
                    .cornerRadius(20)
                    .foregroundColor(Color("CustomPurple"))
                    .overlay(
                        Text("Continue"))
                    .font(.custom("Figtree-Semibold", size: dynamicWidth(48)))
                    .foregroundColor(.white)
                    .onTapGesture {
                        aa = false
                        print(onboardingViewShown)
                        UserDefaults.standard.onboardingViewShown = false
                        
                        print(onboardingViewShown)
                        presentationMode.wrappedValue.dismiss() // Dismiss the sheet
                        // Navigate to the menu here
                    }
            Spacer()
            
        }
                            
            //MARK: onboarding

        }

        }

    


struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
