//
//  EmptyState.swift
//  consultations
//
//  Created by Sara Ahmed Alshammari on 15/11/1443 AH.
//

import SwiftUI

struct EmptyState: View {
    
    @EnvironmentObject var viewModel : pageFavo
    
    var body: some View {
        
        Text("Hello, World!")
        ForEach(viewModel.items, id: \.self) { sample in
          //  ConsultationCell(card: sample)
            Text(sample.name)
         //   print(sample.name)
        }
        
        
    }
}

struct EmptyState_Previews: PreviewProvider {
    static var previews: some View {
        EmptyState()
    }
}
