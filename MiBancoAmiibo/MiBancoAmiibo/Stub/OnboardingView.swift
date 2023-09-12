//
//  OnboardingView.swift
//  MiBancoAmiibo
//
//  Created by Juan Manuel Moreno on 11/09/23.
//

import SwiftUI

struct OnboardingView: View {
    
    var body: some View {
        VStack {
            Text("Bienvenido nuevo usuario a MiBanco")
                .font(.largeTitle)
                .padding()
            
            Text("Aqui comenzamos el proceso de enrolamiento.")
                .padding()
            
            Spacer()
        }
    }
}
