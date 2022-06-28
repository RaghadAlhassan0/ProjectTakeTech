//
//  SessionConfirmedView.swift
//  Feesback
//
//  Created by Raghad Alhassan on 06/11/1443 AH.
//

import SwiftUI

struct SessionConfirmedView: View {
    var body: some View {
        
        
        ZStack{
            Color.init("background").edgesIgnoringSafeArea(.all)
            
            VStack (alignment: .leading){
                
                HStack{
                    
                    Image(systemName: "checkmark.circle")
                        .resizable()
                        .foregroundColor(Color("MyYellow"))
                        .frame(width:63, height:63)
                        .padding(.horizontal, 177.0)
                        .padding(.top, 16.0)
                        .padding(.vertical, 1.0)
                        .font(Font.title.weight(.ultraLight))
                    
                }
                
                ZStack{
                    Text("Session Confirmed ")
                        .font(.custom("text", size: 20))
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .padding(.leading, 120.0)
                        .padding(.bottom, 6.0)
                        .padding(.top, 6.0)
                }
                
                HStack{
                    Text("A confirmation mail will be sent to your email Please refer to our no-show/cancellation policy for our sessions")
                        .font(.custom("text", size: 13))
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 57.0)
                        .padding(.bottom, 471.0)
                    
                    
                }
                
            }
            
            
            ZStack{
                Rectangle()
                    .padding(.top, 1.0)
                
                
                    .frame(width: 342.0, height: 284.0)
                    .cornerRadius(6)
                    .foregroundColor(.init("gray"))
                
                
                
                HStack{
                    
                    Image("ImgKhalid")
                        .resizable()
                        .frame(width: 56, height: 56)
                    
                        .padding(.leading, 30.0)
                    
                    
                    
                    
                    
                    Text("Khalid Almonyr")
                        .font(.system(size: 20, weight: .semibold, design: .default))
                        .fontWeight(.medium)
                    
                        .padding(.all, 6.0)
                    
                    
                    
                        .padding(.trailing, 104.0)
                }.padding(.bottom, 200)
                
                
                VStack{
                    
                    HStack{
                        
                        
                        Text("Name")
                        
                            .padding(.top, 40.0)
                        
                        Text("Mohammed")
                            .foregroundColor(Color.gray)
                            .padding(.top, 40.0)
                            .padding(.leading, 130.0)
                    }.padding()
                    
                    
                    HStack{
                        
                        Text("Date")
                        
                            .padding(.trailing, 20.0)
                        Text("20th May 2022")
                            .foregroundColor(Color.gray)
                            .padding(.leading, 96.0)
                        
                        
                    }
                    
                    HStack{
                        Text("Time")
                            .padding(.trailing, 20.0)
                        
                        Text("6:20 PM")
                            .foregroundColor(Color.gray)
                            .padding(.leading, 145.0)
                        
                    }
                    .padding(.top)
                    
                }.padding(.leading, 16.0)
                    .padding(.trailing, 16.0)
                
                
                VStack{
                    
                    
                    Spacer()
                    
                    Button(action:{
                        
                    }) {
                        
                        
                        
                        Text("Done")
                            .foregroundColor(.black)
                            .fontWeight(.medium)
                            .frame(width: 285, height: 40, alignment: .center)
                            .background(.foreground)
                            .cornerRadius(6)
                            .foregroundColor(.init("blue"))
                        
                    }
                    
                    
                    .padding(.bottom, 80.0)
                    .padding(.trailing, 12.0)
                    
                }
                .padding(.leading)
                
                
            }
        }
    }
}

struct SessionConfirmedView_Previews: PreviewProvider {
    static var previews: some View {
        SessionConfirmedView()
            .preferredColorScheme(.dark)
    }
}
