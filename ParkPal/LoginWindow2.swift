//
//  LoginWindow2.swift
//  ParkPal
//
//  Created by Fred Zirbel on 10/8/23.
//

import SwiftUI

struct LoginWindow2: View {
    
        @State var email: String = ""
        @State var password: String = ""
        @State private var hidePassword: Bool = false  // State to control visibility of password
        @State private var navigateToMainMenu: Bool = false // Controls navigation to MainMenu
        @State private var showAlert: Bool = false // Controls the alert display

        
        // Computed property to check if both fields are filled out
        var isInputValid: Bool {
            return !email.isEmpty && !password.isEmpty
        }
    
    var body: some View {

            ZStack{
                
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.5), Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    
                    //app name text
                    Text("Login")
                        .font(.custom("Gilgan", size: 40))
                        .foregroundStyle(.black)
                        .padding(.top, 120)
                        .padding(.bottom, 20)
                    
                    TextField("Email", text: $email)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 370)
                        .disableAutocorrection(true)
                    
                    if hidePassword {
                           SecureField("Password", text: $password)
                               .textFieldStyle(.roundedBorder)
                               .frame(width: 370)
                               .overlay(
                                   Image(systemName: "eye")
                                       .onTapGesture {
                                           hidePassword.toggle()
                                       }
                                   , alignment: .trailing
                               )
                       } else {
                           TextField("Password", text: $password)
                               .textFieldStyle(.roundedBorder)
                               .frame(width: 370)
                               .overlay(
                                   Image(systemName: "eye.slash")
                                       .onTapGesture {
                                           hidePassword.toggle()
                                       }
                                   , alignment: .trailing
                               )
                       }
                    // Navigation link button
                    
                    NavigationLink("Forgot password?", destination: ForgotPassword())
                    
                    if navigateToMainMenu {
                                           NavigationLink("", destination: MainMenu(), isActive: $navigateToMainMenu)
                                               .opacity(0) // Invisible
                                       }
                    
                    //login button
                    Button(action: {
                                       // Example check, replace with your own validation logic
                        if email == "Fred.zirbel@mavs.uta.edu" && password == "Test123" {
                                           navigateToMainMenu = true
                                       } else {
                                           showAlert = true
                                       }
                                   }, label: {
                                       Text("Log in")
                                           .padding(.horizontal, 135)
                                           .padding(.vertical, 5)
                                           .foregroundStyle(.black)
                                   })
                                   .frame(width: 450, height: 60)
                                   .buttonStyle(.borderedProminent)
                                   .tint(.white)
                                   .buttonBorderShape(.capsule)
                                   .padding(.top, 35)
                                   .opacity(isInputValid ? 1.0 : 0.5) // Set opacity based on the input validity
                                   .disabled(!isInputValid) // Disable button if input isn't valid
                                   
                    //apple button
                                       Button(action: {
                                           
                                           //action here
                                           
                                       }, label: {
                                           HStack {
                                               Image(systemName: "applelogo")
                                                   .foregroundStyle(Color.black)
                                                   .font(.system(size: 22.5))
                                               Text("Log in with Apple")
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
                            Text("Log in with Google")
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
                    
                    
                                   
                               }
                               .alert(isPresented: $showAlert) {
                                   Alert(title: Text("Error"), message: Text("Invalid credentials. Please try again."), dismissButton: .default(Text("OK")))
                               }
                           }
                       }
                   }
                  
                
            
    
#Preview {
    LoginWindow2()
}
