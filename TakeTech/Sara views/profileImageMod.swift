//
//  profileImageMod.swift
//  profilePage
//
//  Created by Sara Ahmed Alshammari on 14/11/1443 AH.
//

import Foundation
import SwiftUI
extension Image {
    
    func profileImageMod() -> some View{
        self
            .resizable()
            .frame(width: 100, height: 100, alignment: .leading)
            .clipShape(Circle())
        
    }
    func ivatarImageMod() -> some View{
        self
        
            .resizable()

            .clipShape(Rectangle())
            .scaledToFit()

        
    }
    
}
