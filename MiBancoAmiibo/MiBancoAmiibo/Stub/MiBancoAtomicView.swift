//
//  MiBancoAtomicView.swift
//  MiBancoAmiibo
//
//  Created by Juan Manuel Moreno on 14/09/23.
//

import SwiftUI

// Define Atoms
struct TextAtom: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.body)
    }
}

struct ImageAtom: View {
    var imageName: String

    var body: some View {
        Image(systemName: imageName)
            .font(.largeTitle)
    }
}

// Define Molecules
struct HeaderMolecule: View {
    var title: String

    var body: some View {
        VStack {
            TextAtom(text: title)
                .font(.largeTitle)
                .padding()
        }
    }
}

struct IconTextMolecule: View {
    var iconName: String
    var text: String

    var body: some View {
        HStack {
            ImageAtom(imageName: iconName)
            Spacer()
            TextAtom(text: text)
            Spacer()
            Spacer()
        }
    }
}

// Define Organisms
struct CardOrganism: View {
    var title: String
    var iconName: String

    var body: some View {
        VStack {
//            HeaderMolecule(title: title)
            IconTextMolecule(iconName: iconName, text: title)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
    }
}

// Define Templates
struct CardListTemplate: View {
    var body: some View {
        VStack {
            CardOrganism(title: "Card 1", iconName: "star.fill")
            CardOrganism(title: "Card 2", iconName: "heart.fill")
        }
    }
}
