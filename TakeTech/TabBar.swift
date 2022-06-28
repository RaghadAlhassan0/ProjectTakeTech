//
//  TabBarView.swift
//  Feesback
//
//  Created by Raghad Alhassan on 10/11/1443 AH.
//

import SwiftUI

struct TabBar: View {
    @EnvironmentObject private var firebaseManager: FireBaseManager
    
    init(){
        UITabBar.appearance().backgroundColor =  UIColor(.init("gray"))
        
    }
    var body: some View {
        
        TabView {
            if firebaseManager.isConsultant {
                SessionView()
                    .tabItem {
                        Label("Sessions", systemImage: "beats.headphones")
                    }
                    
            } else {
                ListOfCards()
                    .tabItem {
                        Label("Consultants", systemImage: "bubble.left.and.exclamationmark.bubble.right.fill")
                    }
            }
            
            if firebaseManager.isConsultant {
                scheduleView()
                    .tabItem {
                        Label("Schedule", systemImage: "calendar")
                    }
            } else {
                SessionView()
                    .tabItem {
                        Label("Sessions", systemImage: "beats.headphones")
                    }
            }
            
            userProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }.accentColor(.primary)
            
        
    }
}


struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .environmentObject(FireBaseManager())
            .preferredColorScheme(.dark)
    }
}
