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

    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
