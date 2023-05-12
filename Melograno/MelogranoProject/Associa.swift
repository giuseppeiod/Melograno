//
//  Associa.swift
//  MelogranoProject
//
//  Created by Giuseppe Iodice on 12/05/23.
//
import SwiftUI
import UniformTypeIdentifiers

struct Season: Identifiable {
    var id = UUID()
    var name: String
    var image: String
}

struct Associa: View {
    @State private var seasons: [Season] = [
        Season(name: "Spring", image: "spring"),
        Season(name: "Summer", image: "summer"),
        Season(name: "Autumn", image: "autumn"),
        Season(name: "Winter", image: "winter")
    ].shuffled()
    @State private var images = ["spring", "summer", "winter", "autumn"]
        @State private var words = ["primavera", "estate", "inverno", "autunno"]
    @State private var currentImageIndex: Int?

    var body: some View {
            VStack {
                ForEach(images.indices, id: \.self) { index in
                    Image(images[index])
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .padding()
                        .onDrag {
                            self.currentImageIndex = index
                            return NSItemProvider(object: String(index) as NSString)
                        }
                }

                ForEach(words.indices, id: \.self) { index in
                    Text(words[index])
                        .padding()
                        .onDrop(of: [.plainText], delegate: SimpleDropDelegate(currentIndex: index, currentImageIndex: $currentImageIndex, words: $words, images: $images))
                }
            }
        }
    }

    struct SimpleDropDelegate: DropDelegate {
        let currentIndex: Int
        @Binding var currentImageIndex: Int?
        @Binding var words: [String]
        @Binding var images: [String]

        func performDrop(info: DropInfo) -> Bool {
            guard let currentImageIndex = currentImageIndex else { return false }
            if currentIndex == currentImageIndex {
                words.remove(at: currentIndex)
                images.remove(at: currentIndex)
                return true
            } else {
                // riavvia il gioco
                words.shuffle()
                images.shuffle()
                return false
            }
        }
        
        func dropUpdated(info: DropInfo) -> DropProposal? {
            return DropProposal(operation: .copy)
        }
        
        func dropEntered(info: DropInfo) {
            // Optional: You might use this to animate the potential drop target
        }
    }
struct Associa_Previews: PreviewProvider {
    static var previews: some View {
        Associa()
    }
}
