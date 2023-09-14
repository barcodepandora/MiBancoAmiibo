//
//  ProfileView.swift
//  MiBancoAmiibo
//
//  Created by Juan Manuel Moreno on 13/09/23.
//

import SwiftUI

struct ProfileView: View {
    
    @Binding var isLoggedIn: Bool
    
    var body: some View {
        VStack {
            Text("Perfil del Usuario")
                .font(.largeTitle)
                .padding()

            CardOrganism(title: "Nombre: Juan Pérez", iconName: "star.fill")
            CardOrganism(title: "Correo Electrónico: juan@example.com", iconName: "heart.fill")

            Button(action: {
                isLoggedIn = false
            }) {
                Text("Cerrar sesión")
            }
        }
    }
}
