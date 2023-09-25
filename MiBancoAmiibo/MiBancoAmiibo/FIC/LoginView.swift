//
//  LoginView.swift
//  MiBancoAmiibo
//
//  Created by Juan Manuel Moreno on 11/09/23.
//

import SwiftUI

struct LoginView: View {
    
    @Binding var isLoggedIn: Bool
    @State private var isInOnboarding = false
    @State private var username = ""
    @State private var password = ""
    @State private var isInvalidCredentials = false
    var data = OnboardingDataModel.data
    
    var body: some View {
        if isInOnboarding {
            OnboardingViewPure(data: data, doneFunction: {
                /// Update your state here
//                self.onboardinDone = true
                print("done onboarding")
            })        } else {
            VStack {
                Text("MiBanco")
                    .font(.largeTitle)
                    .padding()
                
                TextField("Usuario", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                SecureField("Clave", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                if isInvalidCredentials {
                    Text("Las credenciales no son correctas. Probar de nuevo")
                        .foregroundColor(.red)
                        .padding()
                }
                
                Button(action: {
                    // Implement your login logic here.
                    // For simplicity, we'll just set isLoggedIn to true.
                    if isValidCredentials(username: username, password: password) {
                        isLoggedIn = true
                    } else {
                        // Invalid credentials; show an error message.
                        isInvalidCredentials = true
                    }
                    
                }) {
                    Text("Ingresar")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    // Implement your login logic here.
                    // For simplicity, we'll just set isLoggedIn to true.
                    isInOnboarding = true
                }) {
                    Text("Registrarse")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Spacer()
            }
            .padding()
        }
    }
    
    func isValidCredentials(username: String, password: String) -> Bool {
        // Replace this with your validation logic, e.g., checking against a database or API.
        let validUsername = "Juan"
        let validPassword = "clave123"
        
        LaunchViewModel()
        
        return username == validUsername && password == validPassword
    }
}
