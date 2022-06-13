//
//  TabBarConsu.swift
//  Feesback
//
//  Created by Raghad Alhassan on 11/11/1443 AH.
//

import SwiftUI

struct TabBarConsu: View {
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
        
        .accentColor(.white)
    }
    
}


struct TabBarConsu_Previews: PreviewProvider {
    static var previews: some View {
        TabBarConsu()
            .preferredColorScheme(.dark)
    }
}
