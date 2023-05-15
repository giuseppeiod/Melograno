//
//  MelogranoProjectApp.swift
//  MelogranoProject
//
//  Created by Giuseppe Iodice on 10/05/23.
//

import SwiftUI

@main
struct MelogranoProjectApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            Associa()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
