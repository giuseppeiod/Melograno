//
//  SeasonGame.swift
//  MelogranoProject
//
//  Created by Giuseppe Iodice on 10/05/23.
//

/*import SwiftUI
import UniformTypeIdentifiers

struct Season: Identifiable {
    var id = UUID()
    var name: String
    var image: String
}

struct SeasonGame: View {
    @State private var seasons: [Season] = [
        Season(name: "Winter", image: "Winter"),
        Season(name: "Spring", image: "Spring"),
        Season(name: "Summer", image: "Summer"),
        Season(name: "Autumn", image: "Autumn")
    ]
    
    @State private var shuffledImages: [String] = ["Winter", "Spring", "Summer", "Autumn"].shuffled()
    @State private var dragging: String?
    
    var body: some View {
        VStack {
            Text("Mettere in ordine le stagioni")
                .font(.headline)
                .padding(.bottom, 50)
            
            HStack {
                ForEach(shuffledImages, id: \.self) { image in
                        Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .padding()
                        .onDrag {
                            self.dragging = image
                            return NSItemProvider(object: image as NSString)
                        }
                        .opacity(dragging == image ? 0.5 : 1)
                }
            }
            
            ForEach(0..<seasons.count, id: \.self) { index in
                HStack {
                    Text(self.seasons[index].name)
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    
                    //Image(self.seasons[index].image)
                        //.resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .padding()
                        .onDrop(of: [.text], delegate: DropViewDelegate(image: self.seasons[index].image, dropped: { droppedImage in
                            if self.seasons[index].image == droppedImage {
                                if let draggingIndex = self.shuffledImages.firstIndex(of: self.dragging ?? "") {
                                    self.shuffledImages.remove(at: draggingIndex)
                                }
                                self.dragging = nil
                            }
                        }))
                }
                .padding(.bottom, 20)
            }
        }
        .padding()
    }
}

struct DropViewDelegate: DropDelegate {
    let image: String
    let dropped: (String) -> Void
    
    func performDrop(info: DropInfo) -> Bool {
        if let item = info.itemProviders(for: [.text]).first {
            item.loadItem(forTypeIdentifier: UTType.plainText.identifier, options: nil) { (droppedImage, error) in
                DispatchQueue.main.async {
                    if let droppedImageString = droppedImage as? String {
                        self.dropped(droppedImageString)
                    } else if let droppedImageData = droppedImage as? Data {
                        let droppedImageString = String(data: droppedImageData, encoding: .utf8)
                        self.dropped(droppedImageString ?? "")
                    } else {
                        print("Unknown data type")
                    }
                }
            }
            return true
        } else {
            return false
        }
    }
    
    func itemMatches(_ info: DropInfo) -> Bool {
        return info.hasItemsConforming(to: [.text]) && info.itemProviders(for: [.text]).count > 0
    }
    
    func dropEntered(info: DropInfo) {
        if itemMatches(info) {
            if let item = info.itemProviders(for: [.text]).first {
                item.loadItem(forTypeIdentifier: UTType.plainText.identifier,
                options: nil) { (droppedImage, error) in
                    DispatchQueue.main.async {
                        if let droppedImageString = droppedImage as? String {
                            self.dropped(droppedImageString)
                        } else if let droppedImageData = droppedImage as? Data {
                            let droppedImageString = String(data: droppedImageData, encoding: .utf8)
                            self.dropped(droppedImageString ?? "")
                        } else {
                            print("Unknown data type")
                        }
                    }
                }
            }
        }
    }
    
    func dropUpdated(info: DropInfo) -> DropProposal? {
        return DropProposal(operation: .copy)
    }
    
    func dropExited(info: DropInfo) {
    }
}

struct SeasonGame_Previews: PreviewProvider {
    static var previews: some View {
        SeasonGame()
    }
}



 */
import SwiftUI
import UniformTypeIdentifiers

struct Season: Identifiable {
    var id = UUID()
    var name: String
    var image: String
}

struct SeasonGame: View {
    @State private var seasons: [Season] = [
        Season(name: "Winter", image: "Winter"),
        Season(name: "Spring", image: "Spring"),
        Season(name: "Summer", image: "Summer"),
        Season(name: "Autumn", image: "Autumn")
    ]
    
    @State private var shuffledImages: [String] = ["Winter", "Spring", "Summer", "Autumn"].shuffled()
    @State private var dragging: String?
    @State private var currentSeasonIndex: Int = 0
    
    var body: some View {
        VStack {
            Text("Metti in ordine le Stagioni \nTrascina L'immagine della stagione nella giusta direzione")
                .font(.headline)
                .padding(.bottom, 50)
            
            HStack {
                ForEach(shuffledImages, id: \.self) { image in
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .padding()
                        .onDrag {
                            self.dragging = image
                            return NSItemProvider(object: image as NSString)
                        }
                        .opacity(dragging == image ? 0.5 : 1)
                }
            }
            
            ForEach(0..<seasons.count, id: \.self) { index in
                HStack {
                    Text(self.seasons[index].name)
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    
                    //Image(self.seasons[index].image)
                    //.resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .padding()
                        .onDrop(of: [.text], delegate: DropViewDelegate(image: self.seasons[index].image, dropped: { droppedImage in
                            if self.seasons[index].image == droppedImage {
                                if index == self.currentSeasonIndex {
                                    print("Correct season matched: \(self.seasons[index].name)")
                                    // ...
                                }
                                if index == self.currentSeasonIndex {
                                    self.currentSeasonIndex += 1
                                    if let draggingIndex = self.shuffledImages.firstIndex(of: self.dragging ?? "") {
                                        self.shuffledImages.remove(at: draggingIndex)
                                    }
                                    self.seasons.remove(at: index)
                                    self.dragging = nil
                                } else {
                                    // Reset
                                    self.currentSeasonIndex = 0
                                    self.shuffledImages = ["Winter", "Spring", "Summer", "Autumn"].shuffled()
                                    self.seasons = [
                                        Season(name: "Winter", image: "Winter"),
                                        Season(name: "Spring", image: "Spring"),
                                        Season(name: "Summer", image: "Summer"),
                                        Season(name: "Autumn", image: "Autumn")
                                    ]
                                }
                            }
                        }))
                }
                .padding(.bottom, 20)
            }
        }
        .padding()
    }
    
}

// DropViewDelegate remains same as before
struct DropViewDelegate: DropDelegate {
    let image: String
    let dropped: (String) -> Void
    
    func performDrop(info: DropInfo) -> Bool {
        if let item = info.itemProviders(for: [.text]).first {
            item.loadItem(forTypeIdentifier: UTType.plainText.identifier, options: nil) { (droppedImage, error) in
                DispatchQueue.main.async {
                    if let droppedImageString = droppedImage as? String {
                        self.dropped(droppedImageString)
                    } else if let droppedImageData = droppedImage as? Data {
                        let droppedImageString = String(data: droppedImageData, encoding: .utf8)
                        self.dropped(droppedImageString ?? "")
                    } else {
                        print("Unknown data type")
                    }
                }
            }
            return true
        } else {
            return false
        }
    }
    
    func itemMatches(_ info: DropInfo) -> Bool {
        return info.hasItemsConforming(to: [.text]) && info.itemProviders(for: [.text]).count > 0
    }
    
    func dropEntered(info: DropInfo) {
        if itemMatches(info) {
            if let item = info.itemProviders(for: [.text]).first {
                item.loadItem(forTypeIdentifier: UTType.plainText.identifier,
                              options: nil) { (droppedImage, error) in
                    DispatchQueue.main.async {
                        if let droppedImageString = droppedImage as? String {
                            self.dropped(droppedImageString)
                        } else if let droppedImageData = droppedImage as? Data {
                            let droppedImageString = String(data: droppedImageData, encoding: .utf8)
                            self.dropped(droppedImageString ?? "")
                        } else {
                            print("Unknown data type")
                        }
                    }
                }
            }
        }
    }
    
    func dropUpdated(info: DropInfo) -> DropProposal? {
        return DropProposal(operation: .copy)
    }
    
    func dropExited(info: DropInfo) {
    }
}

struct SeasonGame_Previews: PreviewProvider {
    static var previews: some View {
        SeasonGame()
    }
}
