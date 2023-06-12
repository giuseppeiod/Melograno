//
//  CronoGameView.swift
//  MelogranoProject
//
//  Created by Rita Marrano on 12/06/23.
//

import SwiftUI



struct CronoGameView: View {
    
    
    @State var fullsTmp : [GameBoxPosition] = []
    
    @State var bottomsTmp : [GameBoxPosition] = []
    
    @State var topsTmp : [GameBoxPosition] = []
    
    @Binding var fulls : [GameBoxPosition]
    
    @Binding var bottoms : [GameBoxPosition]
    
    @Binding var tops : [GameBoxPosition]
    
    @Binding var level: Level
    
    @State var showPopup : Bool = false
    @State var showOpacity : Bool = false
    
    @Environment(\.presentationMode) var dismiss
    
    @State private var selectedSquare: GameBoxPosition? = nil
    
    var body: some View {
        
        ZStack {
            Color.white
            
            if fulls.filter{$0.y == tops.first?.y || $0.y == tops.last?.y}.isEmpty{
                Button(action: {
                    withAnimation{
                        showOpacity.toggle()
                    }
                }, label: {
                    
                    FinishButtonView(buttonText: "Completed!")
                })
                .frame(width: dynamicWidth(256), height: dynamicHeight(82))
                .position(x: dynamicWidth(1136) , y:dynamicHeight(124))
                .onChange(of: showOpacity){_ in
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        withAnimation(.linear(duration: 0.3)){
                            showPopup.toggle()
                        }
                    }
                }
                
            }
            
            VStack(alignment: .leading){
                Text("TIME ORDER")
                    .font(.custom("Figtree-ExtraBold", size: dynamicWidth(34)))
                
                Text("Put the following images in chronological order!")
                    .font(.custom("Figtree-Regular", size: dynamicWidth(32)))
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal,dynamicWidth(60))
            .padding(.top, dynamicHeight(83))
            
            ForEach(bottoms) { bottom in
                VuotoView(size: level == .level3 ? dynamicWidth(150): dynamicWidth(260))
                    .position(CGPoint(x: bottom.x, y: bottom.y))
                    .onTapGesture(count:1) {
                        if selectedSquare != nil{
                            withAnimation{
                                if let index = fulls.firstIndex(where: {$0.id == selectedSquare?.id}){
                                    
                                    fulls[index].x = bottom.x
                                    fulls[index].y = bottom.y
                                    selectedSquare = nil
                                }}
                        }
                    }
            }
            
            ForEach(tops) { top in
                VuotoView(size: level == .level3 ? dynamicWidth(200): dynamicWidth(260))
                    .position(x:top.x,y: top.y)
            }
            
            ForEach(Array(fulls.enumerated()), id: \.offset) { index, element in
                ImageView(image: element.image, size: level != .level3 ? dynamicWidth(256) : (element.y == bottoms[index].y ? dynamicWidth(146) : dynamicWidth(196)))
                    .opacity(selectedSquare != nil && fulls[index].id != selectedSquare!.id ? 0.5 : 1)
                    .position(CGPoint(x: fulls[index].x, y: fulls[index].y))
                    .onTapGesture(count:1) {
                        
                        if selectedSquare == nil{
                            withAnimation{
                                selectedSquare = fulls[index]
                            }
                        }else{
                            
                            if element.y == tops.first?.y || element.y == tops.last?.y {
                                
                                selectedSquare = fulls[index]
                            }else{
                                
                                withAnimation{
                                    if let indexSelected = fulls.firstIndex(where: {$0.id == selectedSquare?.id}){
                                        
                                        print(index)
                                        print(indexSelected)
                                        fulls[indexSelected].x = fulls[index].x
                                        fulls[indexSelected].y = fulls[index].y
                                        fulls[index].x = tops[index].x
                                        fulls[index].y = tops[index].y
                                        selectedSquare = nil
                                    }
                                }
                            }
                        }
                    }
            }
            if showOpacity{
                ZStack{
                    Color.black.opacity(0.8)
                    if showPopup{
                        CongratsView(dismiss: {dismiss.wrappedValue.dismiss()}, replay: {
                            
                            fulls=fullsTmp
                            var type = ""
                            if level == .level1{
                                type = "Crono1"
                            }else if level == .level2{
                                type = "Crono2"
                            }else if level == .level3{
                                type = "Crono3"
                            }
                            let gamesLevel : [[CronoDecoding]] = load(type: type)
                            let selectedGame = gamesLevel.randomElement()
                            let shuffled = selectedGame?.shuffled()
                            for index in fulls.indices{
                                fulls[index].corectIndex = shuffled![index].correctIndex
                                fulls[index].image = shuffled![index].imageName
                                
                            }
                            tops=topsTmp
                            bottoms=bottomsTmp
                            showPopup=false
                            showOpacity=false
                        }, points: fulls.count, result: checkCronoPoints())
                        
                    }
                }
            }
            
        }
        .onAppear{
            fullsTmp=fulls
            topsTmp=tops
            bottomsTmp=bottoms
        }
        .navigationBarBackButtonHidden(showPopup)
        .ignoresSafeArea(.all)
    }
    func checkCronoPoints() -> Int{
        let tmpArray = fulls.sorted{
            $0.x < $1.x
        }
        var total = 0
        for index in tmpArray.indices {
            if tmpArray[index].corectIndex == index+1 {
                total += 1
            }
        }
        return total
    }
    
}

struct CronoGameView_Previews: PreviewProvider {
    static var previews: some View {
        CronoGameView(fulls: .constant([]), bottoms: .constant([]), tops: .constant([]), level: .constant(.level1))
    }
}
struct GameBoxPosition:Identifiable,Codable{
    
    var id = UUID()
    var x:Double
    var y:Double
    var corectIndex:Int = 0
    var image : String = ""
}
