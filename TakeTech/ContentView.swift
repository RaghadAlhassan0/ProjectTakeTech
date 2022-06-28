//
//  ContentView.swift
//  TakeTech
//
//  Created by Arwa Alzahrani on 01/11/1443 AH.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var firebaseManager: FireBaseManager
    var body: some View {
    TabBar()
//        importFile()
//        SignUp()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .environmentObject(FireBaseManager())
    }
}
