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
            
            
            
            
            VStack{
                
                HStack(spacing: 15){
                    
                    Image(systemName: "envelope.fill")
                        .foregroundColor(.gray)
                    
                    TextField("Email Address", text: self.$email)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    
                    
                }
                
                Divider().background(Color.white.opacity(0.5))
                
            }
            
            .padding(.horizontal, 32.0)
            .padding(.top,40)
            
            
            VStack{
                
                HStack(spacing: 15){
                    
                    Image(systemName: "lock.fill")
                        .foregroundColor(.gray)
                    
                    SecureField("Password", text: self.$pass)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    
                    Image(systemName: "eye.slash.fill")
                        .foregroundColor(.gray)
                    
                }
                
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
            
            
            
            
            
            
            Button{
                
            } label:{
                Text("Login")
                
                    .frame(width: 250, height: 25)
                
            }
            
            .buttonStyle(.bordered)
            .foregroundColor(.black)
            .background(Color("blue"))
            .cornerRadius(4)
            
            .padding(/*@START_MENU_TOKEN@*/.all, 32.0/*@END_MENU_TOKEN@*/)
            
            
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
            
            Button{
                
            } label:{
                Text("Sign in with Apple")
                
                    .frame(width: 250, height: 25)
                
                
            }
            .buttonStyle(.bordered)
            .foregroundColor(.black)
            .background(.white)
            .cornerRadius(4)
            
            .padding(/*@START_MENU_TOKEN@*/[.top, .leading, .trailing]/*@END_MENU_TOKEN@*/)
            
            
            
            Button{
                
            } label:{
                Text("Sign in with Google")
                
                    .frame(width: 250, height: 25)
                
                
            }
            .buttonStyle(.bordered)
            .foregroundColor(.black)
            .background(.white)
            .cornerRadius(4)
            
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            HStack{
                Text("Don’t have an account?")
                    .font(.footnote)
                
                Text(" Sign Up")
                    .font(.footnote)
                
                    .foregroundColor(Color("MyYellow"))
                    .underline()
                
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


