//
//  Game1View.swift
//  MelogranoProject
//
//  Created by Giuseppe Iodice on 15/05/23.
//

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
    
    @State var combinations: [[Card1]] = []
    
    
    @State var cardsToDrag: [Card1] = []
    @State var cardsToDrop: [Card1] = []
    
    
    

        
    var body: some View {
        
        
        
        if isGameFinishedButton{
            ContentView()
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
            .onAppear {
                // Load combinations from JSON and populate the drag and drop cards
                let combinations = loadCombinationsFromJSON()
                if let firstCombination = combinations.first {
                    cardsToDrag = firstCombination.shuffled()
                    cardsToDrop = firstCombination
                }
            }
            
        }
    }
    
    // PROGRESS BAR
    @ViewBuilder
    func NavBar()->some View{
        
        HStack(spacing: 18){
            Button {
                isGameFinishedButton = true
            } label: {
                Image(systemName:  "xmark")
                    .font(.title)
                    .foregroundColor(.gray)
            }
            
            GeometryReader{ proxy in
                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(.gray.opacity(0.25))
                    
                    Capsule()
                        .fill(.green.opacity(0.25))
                        .frame(width: proxy.size.width * progress)
                }
                
            }.frame(height: 40)
            
            Button {
                
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
                Card1View(card: item)
                    .onDrag {
                        print(item)
                        return  .init(contentsOf: URL(string: item.imageName))!
                    }
                
            }
        }
    }
//    struct CardView: View {
//        let card: Card
//
//        var body: some View {
//            Image(card.imageName)
//                .resizable()
//                .frame(width: 100, height: 100)
//                .background(Color.green)
//                .cornerRadius(10)
//        }
//    }
    
    
    
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
                    Card1View(card: droppedCard)
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
        
        // Load combinations from JSON
        let combinations = loadCombinationsFromJSON()
        
        // Shuffle and assign the drag cards
        if let firstCombination = combinations.first {
            cardsToDrag = firstCombination.shuffled()
        }
        
        // Assign the drop cards
        if let firstCombination = combinations.first {
            cardsToDrop = firstCombination
        }
    }
    
    
    
    func loadCombinationsFromJSON() -> [[Card1]] {
        if let url = Bundle.main.url(forResource: "Game2", withExtension: "geojson"),
           let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            if let combinations = try? decoder.decode([[Card1]].self, from: data) {
                return combinations.map { combination in
                    combination.map { Card1(correctIndex: $0.correctIndex, imageName: $0.imageName) }
                }
            }
        }
        return []
    }
}

struct Game1View_Previews: PreviewProvider {
    static var previews: some View {
        Game1View()
    }
}
