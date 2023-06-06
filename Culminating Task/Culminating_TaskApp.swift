//
//  Culminating_TaskApp.swift
//  Culminating Task
//
//  Created by Alistair Fraser on 2023-06-02.
//

import SwiftUI

@main
struct Culminating_TaskApp: App {
    var body: some Scene {
        WindowGroup {
           PlaylistView()
            // Make the database available to all other views through the environment
                .environment(\.blackbirdDatabase, AppDatabase.instance)
        }
    }
}
