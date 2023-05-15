//
//  MenuPage.swift
//  MelogranoProject
//
//  Created by Giuseppe Iodice on 15/05/23.
//

import SwiftUI


struct MenuPage: View {
    @State private var showGame1 = false
    
    var body: some View {
        ZStack {
            if showGame1 {
                Game1View()
            } else {
                VStack(spacing: 20) {
                    GridView(columns: 2) {
                        GameButton(title: "Game 1") {
                            showGame1 = true
                        }
                    }
                    
                    Spacer()
                }
                .padding()
            }
        }
    }
}

struct MenuPage_Previews: PreviewProvider {
    static var previews: some View {
        MenuPage()
    }
}

