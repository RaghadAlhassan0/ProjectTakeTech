//
//  TabBarView.swift
//  Feesback
//
//  Created by Raghad Alhassan on 10/11/1443 AH.
//

import SwiftUI

struct TabBar: View {
    init(){
        UITabBar.appearance().backgroundColor =  UIColor(.init("gray"))
        

       
    }
    var body: some View {
        
        
        TabView {
            
            
            Text("Consul...")
             
                .tabItem {
                    Image(systemName:"bubble.left.and.exclamationmark.bubble.right.fill")
                    
                    Text("Consultants")
                      
                        
                  
                    
                }
            
            
            SessionView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Sessions")
                }
            
            Text("Prof..")
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                    
                }
            
                
        }
        
        .accentColor(.white)
        .frame(height:820)
        
    }
    
    
    
}


struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .preferredColorScheme(.dark)
    }
}
