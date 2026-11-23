//
//  MazeAlertView.swift
//  TheMazeRunner
//
//  Created by Jaloliddin Esonboyev on 21/11/2026.
//

import SwiftUI

enum MazeAlertStep: Int, CaseIterable {
    case ready = 0
    case survive = 1
    case keepRunning = 2
    case completed = 3
    
    var title: String {
        switch self {
        case .ready:
            return "GET READY TO RUN"
        case .survive:
            return "Survive from grievers!"
        case .keepRunning:
            return "Keep running!"
        case .completed:
            return "You have successfully completed the Maze Trials!"
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .ready, .survive, .keepRunning:
            return MazeTheme.backgroundDark
        case .completed:
            return Color(red: 0/255, green: 140/255, blue: 25/255) // Vibrant Green #008C19
        }
    }
    
    var circleBackgroundColor: Color {
        switch self {
        case .ready, .survive:
            return Color(red: 225/255, green: 35/255, blue: 35/255) // Red #E12323
        case .keepRunning:
            return Color(red: 125/255, green: 120/255, blue: 168/255) // Slate Purple #7D78A8
        case .completed:
            return .white
        }
    }
    
    var iconSystemName: String {
        switch self {
        case .ready, .survive:
            return "exclamationmark.triangle.fill"
        case .keepRunning:
            return "figure.run"
        case .completed:
            return "checkmark"
        }
    }
    
    var iconForegroundColor: Color {
       switch self {
       case .ready, .survive, .keepRunning:
           return .white
       case .completed:
           return Color(red: 0/255, green: 140/255, blue: 25/255)
       }
    }
}

struct MazeAlertView: View {
    let step: MazeAlertStep
    
    var body: some View {
        ZStack {
            step.backgroundColor
                .ignoresSafeArea()
                .animation(.easeInOut(duration: 0.5), value: step.backgroundColor)
            
            VStack(spacing: 28) {
                ZStack {
                    Circle()
                        .fill(step.circleBackgroundColor)
                        .frame(width: 76, height: 76)
                    
                    Image(systemName: step.iconSystemName)
                        .font(.title)
                        .foregroundColor(step.iconForegroundColor)
                }
                
                Text(step.title)
                    .font(.title.bold())
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(.horizontal, 32)
                    .lineSpacing(4)
            }
            .id(step)
            .transition(.asymmetric(
                insertion: .opacity.combined(with: .scale(scale: 0.96)),
                removal: .opacity
            ))
        }
        .ignoresSafeArea()
    }
}



#Preview("Ready") {
    MazeAlertView(step: .ready)
}

#Preview("Survive") {
    MazeAlertView(step: .survive)
}

#Preview("Running") {
    MazeAlertView(step: .keepRunning)
}

#Preview("Completed") {
    MazeAlertView(step: .completed)
}
