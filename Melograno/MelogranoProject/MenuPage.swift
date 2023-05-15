//
//  MenuPage.swift
//  MelogranoProject
//
//  Created by Giuseppe Iodice on 15/05/23.
//

import SwiftUI

struct MenuPage: View {
    @State private var showGame1 = false
    @State private var showGame2 = false
    
    var body: some View {
        ZStack {
            VStack{
                if showGame1 {
                    Game1View()
                } else {
                    VStack(spacing: 20) {
                        GridView(columns: 3) {
                            GameButton(title: "Game 1") {
                                showGame1 = true
                            }
                            GameButton(title: "Game 2") {
                                showGame2 = true
                            }
                        }
                        
                        Spacer()
                    }
                    .padding()
                }
                
                
            }
        }
    }
}
struct MenuPage_Previews: PreviewProvider {
    static var previews: some View {
        MenuPage()
    }
}

