//
//  Modale.swift
//  MelogranoProject
//
//  Created by Francesco on 01/06/23.
//
import SwiftUI

struct Modale: View {
    
    @State private var isStartMenuActive = false
    
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
                HStack {
                    Spacer()
                    NavigationLink(destination: Menu(), isActive: $isStartMenuActive)
                    
                    {
                        Text("Avanti")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(8)
        
                    }
                 
                    
                    .padding(.bottom, 15)
                    .padding(.trailing, 15)
                    .onTapGesture {
                        isStartMenuActive = true
                        
                    }
                }
          
            }
          
        
        
      
          
            .background(Color.white)
            .cornerRadius(20)
            .frame(width: 500, height: 550)
            
        }
     
    }
      
}
struct Modale_Previews: PreviewProvider {
    static var previews: some View {
        Modale()
    }
}


//import SwiftUI
//
//struct Modale: View {
//    var body: some View {
//
//        ZStack{
//
//            VStack{
//
//
//
//                    Text("Welcome to B.T. Hub")
//                        .font(.largeTitle)
//                        .fontWeight(.bold)
//                        .padding(.top, 20.0)
//
//
//
//
//                Text("Free activity")
//                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                    .padding()
//                HStack {
//                    Image(systemName: "dumbbell.fill")
//                    Text("Train and strengthen your cognitive \n skills \n with stimulating and fun activities!")
//
//                }
//                .padding()
//                HStack{
//                    Image(systemName: "point.topleft.down.curvedto.point.filled.bottomright.up")
//                    Text("You will find many activities that \n stimulate different cognitive areas:\n this way you will keep your mind 100\n percent active.")
//                }
//                .padding()
//                HStack{
//                    Image(systemName: "circle.grid.3x3.fill")
//                    Text("If you want a personalized path, ask \n for the support of an expert who will\n be able to structure the one best\n suited for you.")
//                }
//
//
//                .padding()
//            }
//
//
//            .frame(width: 500, height: 550)
//        }
//        .background(Color.green)
//        .cornerRadius(4)
//
//    }
//
//}
//
//struct Modale_Previews: PreviewProvider {
//    static var previews: some View {
//        Modale()
//    }
//}
