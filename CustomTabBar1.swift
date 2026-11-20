//
//  CustomTabBar1.swift
//  TheMazeRunner
//
//  Created by Jaloliddin Esonboyev on 20/11/2026.
//

import SwiftUI

struct CustomTabBar1: View {
    @Binding var selectedTab: AppTab
    
    init(selectedTab: Binding<AppTab> = .constant(.home)) {
        self._selectedTab = selectedTab
    }
    
    var body: some View {
        HStack(spacing: 0) {
            Button(action: { selectedTab = .home }) {
                VStack(spacing: 6) {
                    Image(systemName: "house")
                        .font(.headline)
                    Text("Home")
                        .font(.body)
                }
                .foregroundColor(selectedTab == .home ? MazeTheme.tabActive : MazeTheme.tabInactive)
                .frame(maxWidth: .infinity)
            }
            .buttonStyle(.plain)
            
            Rectangle()
                .fill(MazeTheme.divider)
                .frame(width: 1, height: 30)
            
            Button(action: { selectedTab = .greenies }) {
                VStack(spacing: 6) {
                    Image(systemName: "person.2")
                        .font(.headline)
                    
                    Text("Greenies")
                        .font(.body)
                }
                .foregroundColor(selectedTab == . greenies ? MazeTheme.tabActive : MazeTheme.tabInactive)
                .frame(maxWidth: .infinity)
            }
            .buttonStyle(.plain)
        }
        .padding(.vertical, 14)
        .background(MazeTheme.tabBarBackground)
    }
}

#Preview {
    CustomTabBar1()
}
