//
//  LoginWindow.swift
//  ParkPal
//
//  Created by Fred Zirbel on 10/7/23.
//

import SwiftUI

struct LoginWindow: View {
    
    var body: some View {
        
        NavigationView{
            
            ZStack{
                
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.5), Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    
                    Spacer()
                    
                    //app name text
                    Text("PARKINGPAL")
                        .font(.custom("Gilgan", size: 55))
                        .foregroundStyle(.black)
                        .padding(.bottom, 127)
                    
                    //App slogan + phrase
                    Text("No time to waste")
                        .font(.custom("Gilgan", size: 30))
                        .foregroundStyle(.black)
                        .bold()
                    
                        .padding()
                    
                    Text("We'll help you find parking, in real-time, hassle-free.")
                        .font(.custom("Arial", size: 20))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.black)
                    
                       
                    
                    //apple button
                    Button(action: {
                        
                        //action here
                        
                    }, label: {
                        HStack {
                            Image(systemName: "applelogo")
                                .foregroundStyle(Color.black)
                                .font(.system(size: 22.5))
                            Text("Join for free with Apple")
                                .font(.custom("Arial", size: 17))
                                .foregroundStyle(.black)
                        }
                        .padding(.horizontal, 75)
                        .padding(.vertical, 5)
                    })
                    .frame(width: 450, height: 60)
                    .buttonStyle(.borderedProminent)
                    .tint(.white)
                    .buttonBorderShape(.capsule)
                    .padding(.top, 35)
                    
                    
                    //google button
                    Button(action: {
                        
                        //action here
                        
                    }, label: {
                        HStack {
                            Image( "googlelogo")
                                .renderingMode(.template)
                                .resizable(resizingMode: .stretch)
                                .aspectRatio(contentMode: .fit)
                                .foregroundStyle(.black)
                                .frame(width: 20)
                            Text("Join for free with Google")
                                .font(.custom("Arial", size: 17))
                                .foregroundStyle(.black)
                        }
                        .padding(.horizontal, 71)
                        .padding(.vertical, 5)
                    })
                    .frame(width: 450, height: 60)
                    .buttonStyle(.borderedProminent)
                    .tint(.white)
                    .buttonBorderShape(.capsule)
                    
                    //email button
                    Button(action: {
                        
                        //action here
                        
                    }, label: {
                        HStack {
                            Image(systemName: "envelope")
                                .foregroundStyle(.black)
                            Text("Join for free with email")
                                .font(.custom("Arial", size: 17))
                                .foregroundStyle(.black)
                        }
                        .padding(.horizontal, 75)
                        .padding(.vertical, 5)
                    })
                    
                    .frame(width: 450, height: 60)
                    .buttonStyle(.borderedProminent)
                    .tint(.white)
                    .buttonBorderShape(.capsule)
                    
                  
                    
                    // Navigation link button
                    NavigationLink(destination: LoginWindow2()) {
                                       Text("Already a member? Login!")
                                           .underline() // Underline modifier
                                           .foregroundStyle(.black)
                                   }
                    .padding(.top, 35)
                    .padding(.bottom, 10)
                }
            }
        }
    }
}

struct LoginWindow_Previews: PreviewProvider {
    static var previews: some View {
        LoginWindow()
    }
}
