//
//  Fivorite.swift
//  consultations
//
//  Created by Sara Ahmed Alshammari on 15/11/1443 AH.
//

import SwiftUI

struct Fivorite: View {
    let faviorte = ""
    @State var isFavorite = false
    @EnvironmentObject var myFavorite : pageFavo
    @EnvironmentObject var firebaseManager: FireBaseManager
    
    var body: some View {
        HStack{
            Text("hhhhhhhhhh")
            List{
                ForEach(myFavorite.items,id: \.self){ myFavorite in
                    ConsultationCell(consultant: myFavorite,
                                     isShowingCardDetailView: .constant(false),
                                     selectedConsultant: .constant(User(id: "", ImageURL: "", imageVideoName: "", name: "", noOFconsultations: 0, description: "", major: "", price: 0, minutes: 0)))
                    if isFavorite{
                        Button {
                        } label: {
                            Image(systemName: ("heart.fill"))
                                .resizable().frame(width: 20, height: 18)
                                .foregroundColor(Color.black).padding(.vertical, 11.0)
                        }
                    }            else{
                        VStack.init( alignment: .trailing, spacing: 20){
                            Button {
                                isFavorite.toggle()
                            } label: {
                                Image(systemName: ("suit.heart"))
                                    .resizable().frame(width: 20, height: 18)
                                    .foregroundColor(Color.white).padding(.vertical, 11.0)
                            }
                        }
                    }
                }
            }.listStyle(.plain)
            Button{
            } label:{
                
            }
        }
    }
}

struct Fivorite_Previews: PreviewProvider {
    static var previews: some View {
        Fivorite()
            .environmentObject(pageFavo())
            .environmentObject(FireBaseManager())
            .preferredColorScheme(.dark)
        
    }
}




