//
//  LogIn.swift
//  TakeTechSH
//
//  Created by Shahad Alkamli on 31/05/2022.
//



import SwiftUI

struct LogIn: View {
    
    @State var email = ""
    @State var pass = ""
    var body: some View {
        
        VStack{
            
            
            Text("TakeTech")
                .font(.largeTitle)
                .padding(.vertical, 60.0)
            
            
            
            VStack{
                
                Text("Email")
                    .frame( maxWidth: .infinity, alignment: .leading)
                
                
                HStack(spacing: 15){
                    
                    Image(systemName: "envelope.fill")
                        .foregroundColor(.gray)
                    
                    TextField("you@example.com", text: self.$email)
                    
                    
                }
                
                .padding(.vertical, 8.0)
                
                Divider().background(Color.white.opacity(0.5))
                
            }
            
            .padding(.horizontal, 32.0)
            .padding(.top, 1.0)
            
            
            VStack{
                
                
                Text("Password")
                    .frame( maxWidth: .infinity, alignment: .leading)
                
                HStack(spacing: 15){
                    
                    Image(systemName: "lock.fill")
                        .foregroundColor(.gray)
                    
                    SecureField("***********", text: self.$pass)
                    
                    Image(systemName: "eye.slash.fill")
                        .foregroundColor(.gray)
                    
                }
                .padding(.vertical, 8.0)
                
                Divider().background(Color.white.opacity(0.5))
                
                
            }
            
            .padding(.horizontal, 32.0)
            .padding(.top,40)
            
            
            
            
            // Forgot Password ...
            
            Button(action: {} , label:{
                
                Text("Forgot your password?")
                    .font(.footnote)
                
                    .foregroundColor(Color("MyYellow"))
                
                    .underline()
            })
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .frame( maxWidth: .infinity, alignment: .trailing)
            
            
            
            
            
            
            VStack{
                
                

                Button (action: {} ){

                    Text("Login")
                        .foregroundColor(.black)
                        .frame(width: 250, height: 15)
                        .padding(.all)
                }
                
                .background(Color("blue"))
                .cornerRadius(4)
                
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                
                // OR
                
                HStack{
                    
                    Rectangle()
                        .fill(Color.gray)
                        .frame(height: 1)
                        .opacity(0.5)
                        .padding(/*@START_MENU_TOKEN@*/.leading, 32.0/*@END_MENU_TOKEN@*/)
                    
                    Text("OR")
                        .font(.footnote)
                        .foregroundColor(Color.gray)
                        .opacity(0.5)
                    
                    
                    Rectangle()
                        .fill(Color.gray)
                        .frame(height: 1)
                        .opacity(0.5)
                        .padding(/*@START_MENU_TOKEN@*/.trailing, 32.0/*@END_MENU_TOKEN@*/)
                    
                }
                
                
       
                Button (action: {} ){

                    Text("Continue with Apple")
                        .foregroundColor(.black)
                        .frame(width: 250, height: 15)
                        .padding(.all)
                }
                
                .background(Color.white)
                .cornerRadius(4)
                
                .padding(/*@START_MENU_TOKEN@*/[.top, .leading, .trailing]/*@END_MENU_TOKEN@*/)
                
                
                
                
                         Button (action: {} ){

                             Text("Continue with Google")
                                 .foregroundColor(.black)
                                 .frame(width: 250, height: 15)
                                 .padding(.all)
                         }
                         
                         .background(Color.white)
                         .cornerRadius(4)
                         
                         .padding(/*@START_MENU_TOKEN@*/[.top, .leading, .trailing]/*@END_MENU_TOKEN@*/)
                         
                         
                
                HStack{
                    Text("Don’t have an account?")
                        .font(.footnote)
                    
                    Text(" Sign Up")
                        .font(.footnote)
                    
                        .foregroundColor(Color("MyYellow"))
                        .underline()
                    
                }
                
                Spacer()
                
                
            }
            
            
        }
    }
}





struct LogIn_Previews: PreviewProvider {
    static var previews: some View {
        LogIn()
        
            .preferredColorScheme(.dark)
        
    }
}


