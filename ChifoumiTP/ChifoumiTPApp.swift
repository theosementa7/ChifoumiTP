//
//  ChifoumiTPApp.swift
//  ChifoumiTP
//
//  Created by KaayZenn on 22/12/2023.
//

import SwiftUI

@main
struct ChifoumiTPApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
