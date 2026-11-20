//
//  MazeRunnerMain.swift
//  TheMazeRunner
//
//  Created by Jaloliddin Esonboyev on 20/11/2026.
//

import SwiftUI

struct MazeRunnerMain: View {
    @State private var selectedTab: AppTab = .home
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                VStack(spacing: 24) {
                    Spacer(minLength: 16)
                    MazeComponentView()
                        .padding(.horizontal, 24)
                    Image("WCKD")
                        .padding(.top, 12)
                    Spacer(minLength: 16)
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
    MazeRunnerMain()
}
