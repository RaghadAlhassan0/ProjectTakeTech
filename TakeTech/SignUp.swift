//
//  SignUp.swift
//  TakeTechSH
//
//  Created by Shahad Alkamli on 31/05/2022.
//


import AuthenticationServices
import SwiftUI

struct SignUp: View {
    
    
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
            
            
            
            
            
            VStack{
            
            
                Button (action: {} ){

                    Text("Sign Up")
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
                    .padding(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                
                Text("OR")
                    .font(.footnote)
                    .foregroundColor(Color.gray)
                    .opacity(0.5)
                
                
                Rectangle()
                    .fill(Color.gray)
                    .frame(height: 1)
                    .opacity(0.5)
                    .padding(/*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                
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
                Text("Already have an account? ")
                    .font(.footnote)
                
                Text("Login")
                    .font(.footnote)
                
                    .foregroundColor(Color("MyYellow"))
                    .underline()
                
                
            }    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)

            
            
            // I agree ...
            
            
            VStack{
                Text("By clicking Sign up, Continue with Apple or Continue with Google, you agree to our")
                
                    .frame(width: 330, height: 50, alignment: .leading)
                       .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .font(.footnote)
                    .multilineTextAlignment(.center)

                    .padding(/*@START_MENU_TOKEN@*/[.top, .leading, .trailing]/*@END_MENU_TOKEN@*/)
                
                
                Button(action: {} , label:{
                    
                    
                    
                    
                    
                    Text( "Terms and Conditions")
                    
                        .foregroundColor(Color("MyYellow"))
                        .font(.footnote)
                    
                    
                        .underline()
                        .multilineTextAlignment(.center)
                })
                
                
            }
            

                
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .padding(/*@START_MENU_TOKEN@*/.top, 16.0/*@END_MENU_TOKEN@*/)

            
            Spacer()

            
        }
        
        
        
    }
    
    
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
        
            .preferredColorScheme(.dark)
        
    }
}


