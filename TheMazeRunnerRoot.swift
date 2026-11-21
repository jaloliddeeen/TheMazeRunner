//
//  TheMazeRunnerRoot.swift
//  TheMazeRunner
//
//  Created by Jaloliddin Esonboyev on 21/11/2026.
//

import SwiftUI

struct TheMazeRunnerRoot: View {
    @State private var selectedTab: AppTab = .home
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
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
                
                CustomTabBar1(selectedTab: $selectedTab)
            }
            .background(MazeTheme.backgroundDark)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Hello runner")
                        .font(.title2.bold())
                        .foregroundColor(.white)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Text("Day 1044")
                        .font(.body)
                        .foregroundColor(MazeTheme.textMuted)
                }
            }
            .toolbarBackground(MazeTheme.headerBackground, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }
}

#Preview {
    TheMazeRunnerRoot()
}
