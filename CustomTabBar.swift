//
//  CustomTabBar.swift
//  TheMazeRunner
//
//  Created by Jaloliddin Esonboyev on 19/11/2026.
//

import SwiftUI

struct CustomTabBar: View {
    
    @Binding var selectedTab: AppTab
    
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
        }
    }
    
}

#Preview {
    CustomTabBar(selectedTab: .constant(.home))
        .background(MazeTheme.backgroundDark)
}
