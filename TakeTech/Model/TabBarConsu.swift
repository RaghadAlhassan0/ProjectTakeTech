//
//  TabBarConsu.swift
//  Feesback
//
//  Created by Raghad Alhassan on 11/11/1443 AH.
//

import SwiftUI

struct TabBarConsu: View {
    
    init(){
        UITabBar.appearance().backgroundColor =  UIColor(.init("gray"))
    }

    var body: some View {
        
        TabView {
            
            Text("Consul...")
                .tabItem {
                    Image(systemName:"calendar")
                    
                    Text("Sessions")
                    
                }
            
            Text("Sess..")
                .tabItem {
                    Image(systemName: "clock.fill")
                    Text("My schedule")
                }
            
            Text("Prof..")
                .tabItem {
                    Image(systemName:"person")
                    Text("Profile")
                    
                }
            
        }
        
        .accentColor(.primary)
    }
    
}


struct TabBarConsu_Previews: PreviewProvider {
    static var previews: some View {
        TabBarConsu()
            .preferredColorScheme(.light)
    }
}
