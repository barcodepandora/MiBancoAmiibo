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

            Spacer()

            // Contenido del perfil del usuario
            Text("Nombre: Juan Pérez")
            Text("Correo Electrónico: juan@example.com")

            Spacer()

            Button(action: {
                isLoggedIn = false
            }) {
                Text("Cerrar sesión")
            }
        }
    }
}
