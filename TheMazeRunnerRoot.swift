//
//  TheMazeRunnerRoot.swift
//  TheMazeRunner
//
//  Created by Jaloliddin Esonboyev on 21/11/2026.
//

import SwiftUI

struct TheMazeRunnerRoot: View {
    @State private var selectedTab: AppTab = .home
    
    @State private var isAlertActive: Bool = false
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
            if isAlertActive {
                MazeAlertView(step: currentAlertStep!)
                    .ignoresSafeArea()
                    .zIndex(999)
                    .transition(.opacity) // Only fades in at t=7s and fades out at the end
            }
        }
        .task {
            await runAlertSequence()
        }
    }
    
    private func runAlertSequence() async {
        try? await Task.sleep(for: .seconds(5))
        
        withAnimation(.easeIn(duration: 0.3)) {
            currentAlertStep = .ready
            isAlertActive = true
        }
        try? await Task.sleep(for: .seconds(4))
        
        withAnimation(.easeInOut(duration: 0.35)) {
            currentAlertStep = .survive
        }
        
        try? await Task.sleep(for: .seconds(4))
        
        withAnimation(.easeInOut(duration: 0.35)) {
            currentAlertStep = .keepRunning
        }
        try? await Task.sleep(for: .seconds(4))
        //
        withAnimation(.easeInOut(duration: 0.4)) {
            currentAlertStep = .completed
        }
        try? await Task.sleep(for: .seconds(4))
        //
        withAnimation(.easeInOut(duration: 2)) {
            selectedTab = .home
            isAlertActive = false
        }
        
        
    }
}

#Preview {
    TheMazeRunnerRoot()
}
