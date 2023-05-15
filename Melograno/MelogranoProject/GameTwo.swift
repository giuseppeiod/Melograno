//
//  GameTwo.swift
//  MelogranoProject
//
//  Created by Giuseppe Iodice on 10/05/23.
//
import SwiftUI

struct Season: Identifiable {
    var id = UUID()
    var name: String
    var image: String
}

struct GameTwo: View {
    @State private var seasons: [Season] = [
        Season(name: "Spring", image: "spring"),
        Season(name: "Summer", image: "summer"),
        Season(name: "Autumn", image: "autumn"),
        Season(name: "Winter", image: "winter")
    ].shuffled()
    
    @State private var currentSeasonIndex = 0
    
    var body: some View {
        VStack {
            Text("Cosa Raffigura l'immagine")
                .font(.headline)
                .padding(.bottom, 50)
            
            if !seasons.isEmpty {
                Image(seasons[currentSeasonIndex].image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
            } else {
                Text("Bravo")
                    .font(.headline)
            }
            
            ForEach(0..<seasons.count, id: \.self) { index in
                Button(action: {
                    if self.seasons[index].image == self.seasons[self.currentSeasonIndex].image {
                        self.seasons.remove(at: index)
                        self.currentSeasonIndex = 0
                    } else if index == self.seasons.count - 1 {
                        self.currentSeasonIndex = (self.currentSeasonIndex + 1) % self.seasons.count
                    }
                }) {
                    HStack {
                        //Image(self.seasons[index].image)
                           // .resizable()
                           // .scaledToFit()
                            //.frame(width: 30, height: 30)
                        Text(self.seasons[index].name)
                            .font(.headline)
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
            Spacer()
        }
        .padding()
    }
}

struct GameTwo_Previews: PreviewProvider {
    static var previews: some View {
        GameTwo()
    }
}

