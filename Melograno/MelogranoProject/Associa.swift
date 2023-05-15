//
//  Associa.swift
//  MelogranoProject
//
//  Created by Giuseppe Iodice on 12/05/23.
//

   import SwiftUI
   import UniformTypeIdentifiers
   import AVFoundation

   struct Associa: View {
       struct GameItem {
           let word: String
           let image: String
       }

       let items = [
             GameItem(word: "Estate", image: "summer"),
             GameItem(word: "Inverno", image: "winter"),
             GameItem(word: "Primavera", image: "spring"),
             GameItem(word: "Autunno", image: "autumn")]
       

       @State private var shuffledItems = [GameItem]()
           @State private var correctAnswers = [Bool]()
           @State private var wrongAnswers = [Bool]()
           @State private var gameFinished = false
           @State private var timeElapsed = 0
           @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
           @State private var player: AVAudioPlayer?

           var body: some View {
               VStack {
                   if gameFinished {
                       Text("Game Over! Your score is \(correctAnswers.filter { $0 }.count) out of \(items.count)")
                           .font(.largeTitle)
                           .padding()
                       Text("Wrong answers: \(wrongAnswers.filter { $0 }.count)")
                           .font(.title)
                           .padding()
                       Text("Time elapsed: \(timeElapsed) seconds")
                           .font(.title)
                           .padding()
                       Button("Play Again", action: resetGame)
                   } else {
                       gameView
                   }
               }
               .onAppear {
                   resetGame()
               }
           }

           var gameView: some View {
               VStack {
                   Text("Time: \(timeElapsed)")
                       .font(.title)
                       .padding()
                   HStack {
                       ForEach(0..<shuffledItems.count, id: \.self) { index in
                           Text(shuffledItems[index].word)
                               .padding()
                               .background(correctAnswers[index] ? Color.green : wrongAnswers[index] ? Color.red : Color.clear)
                               .cornerRadius(10)
                               .onDrag {
                                   let data = String(index).data(using: .utf8)
                                   correctAnswers[index] = false
                                   wrongAnswers[index] = false
                                   return NSItemProvider(item: data as NSSecureCoding?, typeIdentifier: UTType.plainText.identifier)
                               }
                               .opacity(correctAnswers[index] || wrongAnswers[index] ? 0.0 : 1.0)
                       }
                   }
                   HStack {
                       ForEach(0..<shuffledItems.count, id: \.self) { index in
                           Image(shuffledItems[index].image)
                               .resizable()
                               .scaledToFit()
                               .frame(width: 100, height: 100)
                               .onDrop(of: [UTType.plainText.identifier], delegate: SimpleDropDelegate(currentIndex: index, performDropAction: { droppedIndex in
                                   if droppedIndex == index {
                                       correctAnswers[index] = true
                                       playSound()
                                   } else {
                                       wrongAnswers[droppedIndex] = true
                                   }
                                   checkGameOver()
                               }))
                               .opacity(correctAnswers[index] || wrongAnswers[index] ? 0.0 : 1.0)
                       }
                   }
               }
               .onReceive(timer) { _ in
                   if !gameFinished {
                       timeElapsed += 1
                   }
               }
           }
       func resetGame() {
               correctAnswers = Array(repeating: false, count: items.count)
               wrongAnswers = Array(repeating: false, count: items.count)
               shuffledItems = items.shuffled()
               gameFinished = false
               timeElapsed = 0  }
       
       func checkGameOver() {
           if !correctAnswers.contains(false) && !wrongAnswers.contains(true) {
               gameFinished = true
               timer.upstream.connect().cancel() // stop timer
           }
       }

       func playSound() {
           guard let url = Bundle.main.url(forResource: "correctSound", withExtension: "mp3") else { return }
           do {
               player = try AVAudioPlayer(contentsOf: url)
               player?.play()
           } catch {
               print("Couldn't load file")
           }
       }
   }

   struct SimpleDropDelegate: DropDelegate {
       let currentIndex: Int
       let performDropAction: (Int) -> Void

       func performDrop(info: DropInfo) -> Bool {
           if let itemProvider = info.itemProviders(for: [UTType.plainText.identifier]).first {
               itemProvider.loadItem(forTypeIdentifier: UTType.plainText.identifier, options: nil) { (item, error) in
                   if let data = item as? Data, let indexString = String(data: data, encoding: .utf8), let index = Int(indexString) {
                       DispatchQueue.main.async {
                           self.performDropAction(index)
                       }
                   }
               }
               return true
           }
           return false
       }
   }


   struct Assoxia: PreviewProvider {
       static var previews: some View {
           Associa()
       }
   }
