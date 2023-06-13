//
//  Menu.swift
//  MelogranoProject
//
//  Created by Tullio Boccardo on 12/06/23.
//

import SwiftUI


struct Menu: View {
    
    @AppStorage("onboardingViewShown")
    var onboardingViewShown: Bool = false

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
                
                
                if  aa{
                   Image("onbbackground")
                        .resizable()

                        .scaledToFill()
                }
            }
            .ignoresSafeArea()
           
                
        }
        .preferredColorScheme(.light)
        .navigationViewStyle(.stack)
        .sheet(isPresented: $aa, onDismiss: {UserDefaults.standard.onboardingViewShown = true}) {
            
            
           OnBoardingManager()

        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
