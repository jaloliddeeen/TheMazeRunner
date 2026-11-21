//
//  GreeniesView.swift
//  TheMazeRunner
//
//  Created by Jaloliddin Esonboyev on 20/11/2026.
//

import SwiftUI

enum GreenieStatus: String, CaseIterable {
    case alive = "Alive"
    case dead = "Dead"
    
    var color: Color {
        switch self {
        case .alive: return Color(red: 0/255, green: 220/255, blue: 85/255) // #00DC55 vibrant green
        case .dead: return Color(red: 240/255, green: 45/255, blue: 45/255)  // #F02D2D bright red
        }
    }
    
    var iconName: String {
        switch self {
        case .alive: return "checkmark.circle.fill"
        case .dead: return "xmark.circle.fill"
        }
    }
}

struct Greenie: Identifiable {
    let id = UUID()
    let name: String
    let status: GreenieStatus
    let imageName: String?
    let placeholderColor: Color
}

struct GreeniesView: View {
    private var greenies: [Greenie] = [
        Greenie(name: "Thomas", status: .alive, imageName: "thomas", placeholderColor: Color(red: 60/255, green: 55/255, blue: 50/255)),
        Greenie(name: "Teresa", status: .alive, imageName: "teresa", placeholderColor: Color(red: 50/255, green: 65/255, blue: 60/255)),
        Greenie(name: "Gally", status: .alive, imageName: "gally", placeholderColor: Color(red: 70/255, green: 55/255, blue: 40/255)),
        Greenie(name: "Minho", status: .alive, imageName: "minho", placeholderColor: Color(red: 45/255, green: 50/255, blue: 60/255)),
        Greenie(name: "Alby", status: .dead, imageName: "alby", placeholderColor: Color(red: 55/255, green: 60/255, blue: 50/255)),
        Greenie(name: "Newt", status: .alive, imageName: "newt", placeholderColor: Color(red: 65/255, green: 60/255, blue: 55/255)),
        Greenie(name: "Chuck", status: .alive, imageName: "chuck", placeholderColor: Color(red: 65/255, green: 50/255, blue: 40/255)),
        Greenie(name: "Winston", status: .alive, imageName: "winston", placeholderColor: Color(red: 50/255, green: 45/255, blue: 40/255)),
        Greenie(name: "Frypan", status: .alive, imageName: "frypan", placeholderColor: Color(red: 50/255, green: 55/255, blue: 50/255))
    ]
    
    private let columns = [
        GridItem(.flexible(), spacing: 14),
        GridItem(.flexible(), spacing: 14),
        GridItem(.flexible(), spacing: 14)
    ]

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 16) {
                Text("Greenies (56)")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.horizontal, 16)
                    .padding(.top, 18)
                
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(greenies) { greenie in
                        GreenieCardView(greenie: greenie)
                    }
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 16)
            }
        }
    }
}

struct GreenieCardView: View {
    let greenie: Greenie
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            ZStack {
                if let imageName = greenie.imageName, UIImage(named: imageName) != nil {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                } else {
                    Rectangle()
                        .fill(greenie.placeholderColor)
                    
                    VStack(spacing: 4) {
                        Image(systemName: "person.fill")
                            .font(.title2)
                            .foregroundColor(.white.opacity(0.35))
                        
                        Text(String(greenie.name.prefix(1)))
                            .font(.body.bold())
                            .foregroundColor(.white.opacity(0.7))
                    }
                }
            }
            .frame(height: 118)
            .frame(maxWidth: .infinity)
            .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
            
            Text(greenie.name)
                .font(.body.bold())
                .foregroundColor(.white)
                .lineLimit(1)
            
            HStack(spacing: 4) {
                Image(systemName: greenie.status.iconName)
                    .font(.body)
                    .foregroundColor(greenie.status.color)
                
                Text(greenie.status.rawValue)
                    .font(.body)
                    .foregroundColor(greenie.status.color)
            }
        }
    }
}

#Preview {
    GreeniesView()
}
