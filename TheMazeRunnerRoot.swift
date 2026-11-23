//
//  TheMazeRunnerRoot.swift
//  TheMazeRunner
//
//  Created by Jaloliddin Esonboyev on 21/11/2026.
//

import SwiftUI

struct TheMazeRunnerRoot: View {
    @State private var selectedTab: AppTab = .home
    
    @State private var currentAlertStep: MazeAlertStep? = nil
    
    var body: some View {
        ZStack {
            NavigationStack {
                VStack(spacing: 0) {
                    HStack(alignment: .center) {
                        Text("Hello runner")
                            .font(.title2.bold())
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Text("Day 1044")
                            .font(.body)
                            .foregroundColor(MazeTheme.textMuted)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 6)
                    .padding(.bottom, 12)
                    .background(MazeTheme.headerBackground)
                    .background(MazeTheme.headerBackground.ignoresSafeArea(edges: .top))
                    
                    Group {
                        switch selectedTab {
                        case .home:
                            MazeRunnerMain()
                        case .greenies:
                            GreeniesView()
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(MazeTheme.backgroundDark)
                    
                    // Bottom Tab Bar
                    CustomTabBar1(selectedTab: $selectedTab)
                }
                .background(MazeTheme.backgroundDark)
                .toolbar(.hidden, for: .navigationBar)
            }
            if let step = currentAlertStep {
                MazeAlertView(step: step)
                    .id(step)
                    .ignoresSafeArea()
                    .zIndex(999)
                    .transition(.opacity)
            }
        }
        .task {
            await runAlertSequence()
        }
    }
    
    private func runAlertSequence() async {
        try? await Task.sleep(for: .seconds(5))
        
        for step in MazeAlertStep.allCases {
            withAnimation(.easeInOut(duration: 0.45)) {
                currentAlertStep = step
            }
            
            if step == .completed {
                try? await Task.sleep(for: .seconds(3))
            } else {
                try? await Task.sleep(for: .seconds(3))
            }
        }
        
        withAnimation(.easeOut(duration: 2)) {
            selectedTab = .home
            currentAlertStep = nil
        }
    }
}

#Preview {
    TheMazeRunnerRoot()
}
