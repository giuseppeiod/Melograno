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
    
    @Environment(\.presentationMode)
        var presentationMode
    
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    let games:[Game] = [Game(name: "ASSOCIATE",description: "Associate the picture with the corresponding word.", image: "associate", type: .association),Game(name: "TIME ORDER", description: "Put the following images in chronological order!", image: "cronological", type: .cronological),Game(name: "MEMORY", description: "", image: "memory", type: .memory),Game(name: "BUTTONS", description: "", image: "balls", type: .balls)]
    
    @State var aa: Bool = true
    
    var body: some View {
        NavigationView(){
            ZStack{
            
                
                VStack(alignment:.leading){
                    HStack{
                        Text("Welcome")
                            .font(.custom("Figtree-ExtraBold", size: 64))
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
        )) {
            
        
                  //MARK: onboarding
            
            
                
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
                    
                    
                    
                    
                    
                    
                    Rectangle()
                                        .frame(width: 447, height: 65)
                                        .cornerRadius(20)
                                        .foregroundColor(Color("CustomPurple"))
                                        .overlay(
                                            Text("Explore"))
                                        .font(.custom("Figtree-Medium", size: 48))
                                        .foregroundColor(.white)
                                        .onTapGesture {
                                            aa = false
                                            print(onboardingViewShown)
                                            UserDefaults.standard.onboardingViewShown = false
                                            
                                            print(onboardingViewShown)
                                            presentationMode.wrappedValue.dismiss() // Dismiss the sheet
                                            // Navigate to the menu here
                                        }
                                }
                            
            //MARK: onboarding

        }

        }

    }


struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
