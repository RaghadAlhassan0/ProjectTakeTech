//
//  ListOfCards.swift
//  TakeTech
//
//  Created by Arwa Alzahrani on 15/11/1443 AH.
//
import SwiftUI




struct ListOfCards: View {

   @State var searchtext = ""
    @State var isSearching = false

    let majors: [User] = cardmodel.samples

    var body: some View {
        NavigationView{
            ZStack{
                 Color.init("background").edgesIgnoringSafeArea(.all)
                
                
        ScrollView{
            
            VStack{
            HStack{
                TextField("Search...", text: $searchtext)
                    .padding(.horizontal, 40)

                
            }
            .frame(width: .infinity, height: 36, alignment: .center)
                .background(Color(.systemGray5))
                .cornerRadius(4)
                .padding(.horizontal, 16.0)
                .padding(.vertical , 8)
                .onTapGesture(perform: {
                    isSearching = true
                       
                })
                .overlay(HStack{
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    Spacer()
                    
                    if isSearching {
                        
                        Button (action: {searchtext = ""}, label: { Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.gray)
                                .foregroundColor(.white)
                            
                        })
                        
                
                        
                    }
                   
               
                    
                }.padding(.horizontal , 24))
            Spacer()
//        }
                if searchtext.isEmpty {
                    ForEach(cardmodel.samples, id: \.self) { sample in
                        ConsultationCell(card: sample)
                    }
                    
                    
                } else {
                    ForEach(cardmodel.samples.filter({"\($0)".contains(searchtext) }), id: \.self) { sample in
                        ConsultationCell(card: sample)
                    }
                    
                    
                }

//            ForEach ((majors) .filter({"\($0)".contains(searchtext) || searchtext.isEmpty }), id: \.self) {num in
//
//
//
//                                 ConsultationCell(card: cardmodel.samples[1])
//
//            }
                }
           
        }}
            
            .navigationTitle("Consultations")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
       
        }

    
}

struct searchBarview_Previews: PreviewProvider {
    static var previews: some View {
        ListOfCards()
            .preferredColorScheme(.light)
    }
}
