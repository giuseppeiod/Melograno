//
//  Game1View.swift
//  MelogranoProject
//
//  Created by Giuseppe Iodice on 15/05/23.
//

import SwiftUI


import SwiftUI
import CoreData
import UniformTypeIdentifiers
import MobileCoreServices

extension Array {
    subscript(safe index: Index) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}
struct Game1View: View {
    
    @State private var isGameFinishedButton = false
    @State var progress: CGFloat = 0
    
    
    @State var cardsToDrag: [Card1] = [
        Card1(correctIndex: "1", imageName: "uno"),
        Card1(correctIndex: "2", imageName: "due"),
        Card1(correctIndex: "3", imageName: "tre"),
        Card1(correctIndex: "4", imageName: "quattro")
    ].shuffled()
    
    @State var cardsToDrop: [Card1] = [
        Card1(correctIndex: "1", imageName: "1"),
        Card1(correctIndex: "2", imageName: "2"),
        Card1(correctIndex: "3", imageName: "3"),
        Card1(correctIndex: "4", imageName: "4")
    ]
    
    var body: some View {
        
        
        
        if isGameFinishedButton{
            MenuPage()
        }else{
            VStack(spacing: 15){
                NavBar()
                
                Text("Order this images sequence")
                    .font(.title)
                    .fontWeight(.bold)
                
                dragArea()
                dropArea()
                
                
                
                
                
                if isGameFinished() {
                    Text("Game Finished!")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Button("Restart") {
                        restartGame()
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
            .padding()
            .navigationBarHidden(true)}
        
    }
    
    // PROGRESS BAR
    
    @ViewBuilder
    func NavBar() -> some View {
        HStack(spacing: 18) {
            Button(action: {
 
                isGameFinishedButton = true
                
                print("Button pressed")
            }) {
                Image(systemName: "xmark")
                    .font(.title)
                    .foregroundColor(.gray)
            }
            
            GeometryReader { proxy in
                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(.gray.opacity(0.25))
                    
                    Capsule()
                        .fill(.green.opacity(0.25))
                        .frame(width: proxy.size.width * progress)
                }
            }
            .frame(height: 40)
            
            Button {
                // Handle button action here
            } label: {
                Image(systemName: "suit.heart.fill")
                    .font(.title)
                    .foregroundColor(.red)
            }
        }
    }
    
    //DRAG AREA
    @ViewBuilder
    func dragArea()-> some View{
        HStack(spacing: 20){
            
            ForEach(cardsToDrag) { item in
                CardView(card: item)
                    .onDrag {
                        print(item)
                        return  .init(contentsOf: URL(string: item.imageName))!
                    }
                
            }
        }
    }
    struct CardView: View {
        let card: Card1
        
        var body: some View {
            Image(card.imageName)
                .resizable()
                .frame(width: 100, height: 100)
                .background(Color.green)
                .cornerRadius(10)
        }
    }
    
    
    
    func handleCardDrop(draggedCard: Card1, destinationIndex: Int) {
        if draggedCard.correctIndex == cardsToDrop[destinationIndex].correctIndex {
            let updatedCard = Card1(correctIndex: cardsToDrop[destinationIndex].correctIndex, imageName: draggedCard.imageName)
            var updatedCardsToDrop = cardsToDrop
            updatedCardsToDrop[destinationIndex] = updatedCard
            cardsToDrop = updatedCardsToDrop
            
            // Remove dragged cards from cardsToDrag
            cardsToDrag.removeAll { $0.correctIndex == draggedCard.correctIndex }
            
            // Increment the progress bar
            progress += 0.25
            
            print("Correct")
        } else {
            print("Incorrect")
        }
    }

    //DROP AREA
    @ViewBuilder
    func dropArea() -> some View {
        HStack(spacing: 20) {
            ForEach(cardsToDrop.indices, id: \.self) { index in
                if let droppedCard = cardsToDrop[safe: index] {
                    CardView(card: droppedCard)
                        .onDrop(of: [.url], isTargeted: .constant(false)) { providers in
                            if let item = providers.first {
                                item.loadObject(ofClass: URL.self) { value, error in
                                    guard let url = value as? URL else {
                                        return
                                    }
                                    let draggedCardIndex = cardsToDrag.firstIndex { $0.imageName == url.lastPathComponent }
                                    if let draggedCardIndex = draggedCardIndex {
                                        let draggedCard = cardsToDrag[draggedCardIndex]
                                        handleCardDrop(draggedCard: draggedCard, destinationIndex: index)
                                    }
                                }
                            }
                            return true
                        }
                }
            }
        }
    }


    func isGameFinished() -> Bool {
        return progress >= 1.0 || cardsToDrag.isEmpty
    }

    func restartGame() {
        progress = 0
        cardsToDrag = [
            Card1(correctIndex: "1", imageName: "uno"),
            Card1(correctIndex: "2", imageName: "due"),
            Card1(correctIndex: "3", imageName: "tre"),
            Card1(correctIndex: "4", imageName: "quattro")
        ].shuffled()
        cardsToDrop = [
            Card1(correctIndex: "1", imageName: "1"),
            Card1(correctIndex: "2", imageName: "2"),
            Card1(correctIndex: "3", imageName: "3"),
            Card1(correctIndex: "4", imageName: "4")
        ]
    }
}


struct Game1View_Previews: PreviewProvider {
    static var previews: some View {
        Game1View()
    }
}
