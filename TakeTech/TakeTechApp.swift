//
//  TakeTechApp.swift
//  TakeTech
//
//  Created by Arwa Alzahrani on 01/11/1443 AH.
//

import SwiftUI
import Firebase

@main
struct TakeTechApp: App {
    init(){FirebaseApp.configure()}
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
