//
//  MazeRunnerMain.swift
//  TheMazeRunner
//
//  Created by Jaloliddin Esonboyev on 20/11/2026.
//

import SwiftUI

struct MazeRunnerMain: View {
    var body: some View {
        VStack(spacing: 24) {
            Spacer(minLength: 16)
            MazeComponentView()
                .padding(.horizontal, 24)
            Image("WCKD")
                .padding(.top, 12)
            Spacer(minLength: 16)
        }
    }
}

#Preview {
    MazeRunnerMain()
}
