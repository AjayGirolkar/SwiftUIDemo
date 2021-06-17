//
//  SwiftUIDemoApp.swift
//  SwiftUIDemo
//
//  Created by Ajay Girolkar on 16/06/21.
//

import SwiftUI

@main
struct SwiftUIDemoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
