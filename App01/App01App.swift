//
//  App01App.swift
//  App01
//
//  Created by Alumno on 19/09/23.
//

import SwiftUI

@main
struct App01App: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
