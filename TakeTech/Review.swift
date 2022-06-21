//
//  ContentView.swift
//  Feesback
//
//  Created by Raghad Alhassan on 05/11/1443 AH.
//

import SwiftUI

struct Review: View {
    
    @State var ratings = -1
    
    var body: some View {
    
        ZStack{
            Color.init("background").edgesIgnoringSafeArea(.all)
            
            ZStack{
            Rectangle().frame(width: 342, height: 292)
                .cornerRadius(6)
                .foregroundColor(.init("gray"))
                
                VStack{
                    
                    ZStack{
                Image("ImgKhalid")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .padding([.leading, .bottom, .trailing], 9.0)
                    .padding(.top, 21.0)
                        
                    }
                
                    HStack{
                
                        VStack{
                        Text("Khalid Almonyr")
                              
                                    .fontWeight(.medium)
                                    .padding(.horizontal, 40.0)
                            
                    }.padding(.leading, 100.0)
                            .padding(.bottom, -10.0)
                            .padding(.top, -5.0)
                        
                        Spacer()
                    }
                    
                     //star rate
                    VStack{
                    
                
                    HStack( spacing:6, content:{
                        

                        ForEach(1...5,id: \.self){i in

                            Image(systemName:"star.fill").resizable().frame(width:26, height:26).foregroundColor(self.ratings >= i ? .yellow : .gray).onTapGesture {
                                
                          self.ratings = i
                                
                            }
                        }
                        .padding(.top, 20.0)
                    
                        
                    })
                     
                    }
                    //Ratings
                    
                    ZStack{
                        
                        if self.ratings != 0{
                            
                            if self.ratings == 1{
                            
                            Text("Poor")
                             
                            }
                            
                            else if self.ratings == 2 {
                                
                                Text("Okay")
                                    
                            }
                            
                            else if self.ratings == 3 {
                                
                                Text("Good")
                                    
                            }
                            
                            
                            else if self.ratings == 4 {
                                
                                Text("Very Good")
                                    
                            }
                            
                            else if self.ratings == 5 {
                                
                                Text("Excellent")
                                
                            }
                                
                                
                        }

                    }  .padding().frame(width: 137.0, height: 45 )

                
                    
                    HStack{
                        
                        Button(action:{
                            
                        }) {
                   
                    Text("Submit")
                        .foregroundColor(.black)
                        .fontWeight(.medium)
                       .frame(width: 285, height: 40, alignment: .center)
                       .background(.foreground)
                       .cornerRadius(6)
                    .foregroundColor(.init("blue"))
                    
                        }
                    
                        .padding(.bottom)
            
                    }
                }
            }
 
        }
    }
}
struct FeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        Review()
            .preferredColorScheme(.light)
    }
}


