//
//  consultantCard.swift
//  TakeTech
//
//  Created by Arwa Alzahrani on 01/11/1443 AH.
//

import SwiftUI

struct consultantCard: View {
    var PictureArr = ["man1" , "man2" , "man3"]
    var userName = "Henry J"
    var rate = "star.fill"
    var numOfConsulation = 350
    var discription = ""
    var price = Int()
    var sessionTime = Int()
    
    
    var body: some View {
        ZStack{
            Color.init("background").edgesIgnoringSafeArea(.all)
            
           
                VStack{
                    ZStack{
                Image.init(PictureArr[0])
                    .resizable()
                    .frame(width: 358, height: 196)
                    .padding(.top, -17.0)
                        Image.init("play")
                            .resizable()
                            .frame(width: 31, height: 30, alignment: .center)
                        
                    }
                 
                    HStack{
                        
                        
                        Image("avatar")
                            .resizable()
                            .frame(width: 44, height: 44, alignment: .trailing)
                            .clipShape(Circle())
                            
                        
                            
                        
                        
//                        Circle().frame(width: 45, height: 45, alignment: .trailing)
                        
                        
                        VStack (alignment: .leading){
                        Text("henry J")
                                .font(.system(size: 16, weight: .semibold, design: .default))
                                    .fontWeight(.medium)
                            
                            HStack{
                            Image.init(systemName: rate )
                                    .font(.custom( "star", size: 14))
                                .foregroundColor(.yellow)
                                
                                Text("4.84")
                                    .font(.custom("Number", size: 10))
                                Text("\(numOfConsulation) Consultations")
                                    .font(.custom("Number", size: 10))
                                
                                
                            }
                        }.padding(.leading, 5.0)
                        
                        Spacer()
                        Image.init(systemName: "heart")
                        
                        
//                        ---------------Vstack
                        
                    }
                    
                    .padding()
                    
                    VStack{
                        Text("""
                    Holds a Bachelor's degree in Information Technology, an employee at the Public Telecommunications...
                    """)
                    .font(.custom("text", size: 12))
                   
                  
                    
                    Text("Information technology")
                        .font(.custom("Specialize", size: 12))
                        .foregroundColor(.init("blue"))
                        .padding(.leading, -145.0)
                        .padding(.vertical, 3.0)
                    } .padding(.horizontal)
                    
                    Divider().padding(.horizontal, 45.0)
                    
                    HStack{
                        
                        Text("100")
                            .font(.custom("price", size: 16))
                            .foregroundColor(.yellow)
                            .fontWeight(.semibold)
                        Text(" / 30 Minutes")
                            .font(.custom("Number", size: 11))
                            .foregroundColor(.gray)
                        
                        Spacer()
                    }.padding(.bottom, 8.0)
                        .padding(.horizontal, 25)
                   
                    
                    Text("Book")
                        .foregroundColor(.black)
                       .frame(width: 312.02, height: 40, alignment: .center)
                       .background(.foreground)
                       .cornerRadius(6)
                       .foregroundColor(.init("blue"))
                       .padding(.bottom)
                    
                    
                    
                }.background(Color("gray")).cornerRadius(6).frame(width: 358, height: .infinity, alignment: .center)
            
        }
    }
}

struct consultantCard_Previews: PreviewProvider {
    static var previews: some View {
        consultantCard()
            .preferredColorScheme(.dark)
    }
}
