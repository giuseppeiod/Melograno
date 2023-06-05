//
//  Modale.swift
//  MelogranoProject
//
//  Created by Francesco on 01/06/23.
//
import SwiftUI

struct Modale: View {
    var body: some View {
        NavigationView{
        ZStack{
            Image("sfondo2")
                .resizable()
                .ignoresSafeArea()
            VStack{

                Text("Welcome to B.T. Hub")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("Free activity")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                HStack {
                    Image(systemName: "dumbbell.fill")
                    Text("Train and strengthen your cognitive \n skills \n with stimulating and fun activities!")

                }
                HStack{
                    Image(systemName: "point.topleft.down.curvedto.point.filled.bottomright.up")
                    Text("You will find many activities that \n stimulate different cognitive areas:\n this way you will keep your mind 100\n percent active.")
                }
                HStack{
                    Image(systemName: "circle.grid.3x3.fill")
                    Text("If you want a personalized path, ask \n for the support of an expert who will\n be able to structure the one best\n suited for you.")
                }

                NavigationLink("Continua", destination: StartMenu())

                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.blue)
                    .padding()

            }
        }
    }
        .navigationViewStyle(StackNavigationViewStyle())
            .navigationBarBackButtonHidden(true)
    }

}

struct Modale_Previews: PreviewProvider {
    static var previews: some View {
        Modale()
    }
}
