//
//  ForgotPassword.swift
//  ParkPal
//
//  Created by Fred Zirbel on 10/8/23.
//

import SwiftUI

struct ForgotPassword: View {
    
    @State var email: String = ""
    @State private var navigateToForgotPassword2: Bool = false
    @State private var showAlert: Bool = false
    
    var isInputValid: Bool {
        return !email.isEmpty
    }
    
    var body: some View {
        ZStack{
            
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.5), Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack{
                
                Text("Password Reset")
                    .font(.custom("Gilgan", size: 45))
                    .foregroundStyle(.black)
                    .padding(.bottom, 60)
                
                Text("Enter your UTA email below.")
                    .font(.custom("Gilgan", size: 20))
                    .foregroundStyle(.black)
                    .padding(.bottom, 15)
                
                TextField("Enter your email", text: $email) //NO AUTOCORRECT
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 370)
                
                //Reset Password button
                Button(action: {
                    // Example check, replace with your own validation logic
                    if isInputValid == true {
                        showAlert = true
                    } else {
                        
                    }
                }, label: {
                    Text("Confirm")
                        .padding(.horizontal, 100)
                        .padding(.vertical, 5)
                        .foregroundStyle(.black)
                })
                .frame(width: 400, height: 60)
                .buttonStyle(.borderedProminent)
                .tint(.white)
                .buttonBorderShape(.capsule)
                .padding(.top, 35)
                .opacity(isInputValid ? 1.0 : 0.5) // Set opacity based on the input validity
                .disabled(!isInputValid) // Disable button if input isn't valid
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Check your email"), message: Text("We sent a link to reset your password to \(email)"), dismissButton: .default(Text("OK")))
            }
        }
    }
}

struct ForgotPassword_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPassword()
    }
}

