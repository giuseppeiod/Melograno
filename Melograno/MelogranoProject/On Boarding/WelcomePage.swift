//
//  WelcomePage.swift
//  MelogranoProject
//
//  Created by Francesco on 30/05/23.
//

import SwiftUI

struct WelcomeView: View {
    @State private var name = ""

    var body: some View {
        VStack {
            Spacer()
            Text("Benvenuto")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            TextField("Inserisci il tuo nome", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                // Azione da eseguire quando viene premuto il pulsante
                // Puoi accedere al nome inserito utilizzando la variabile `name`
                print("Nome inserito:", name)
            }) {
                Text("Accedi")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
            
            Spacer()
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}

