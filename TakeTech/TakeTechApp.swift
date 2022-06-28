//
//  TakeTechApp.swift
//  TakeTech
//
//  Created by Arwa Alzahrani on 01/11/1443 AH.
//

import SwiftUI
import Firebase
import FirebaseFirestore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct TakeTechApp: App {
    @StateObject var firebaseManager = FireBaseManager()
    @UIApplicationDelegateAdaptor var appDelegate: AppDelegate
    init(){
        UITabBar.appearance().backgroundColor =  UIColor(.init("gray"))
        
    }
    var body: some Scene {
        WindowGroup {
            Group{
               TabBar()
            }.environmentObject(firebaseManager)
        }
    }
}
