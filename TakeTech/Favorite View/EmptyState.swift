//
//  EmptyState.swift
//  consultations
//
//  Created by Sara Ahmed Alshammari on 15/11/1443 AH.
//

import SwiftUI

struct EmptyState: View {
    var body: some View {
        
        Text("Hello, World!")
        ForEach(pageFavo().items, id: \.self) { sample in
            ConsultationCell(card: sample)
        }
        
        
    }
}

struct EmptyState_Previews: PreviewProvider {
    static var previews: some View {
        EmptyState()
    }
}
