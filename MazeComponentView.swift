//
//  MazeComponentView.swift
//  TheMazeRunner
//
//  Created by Jaloliddin Esonboyev on 20/11/2026.
//

import SwiftUI

struct MazeComponentView: View {
    private let mazeGrid: [[Int]] = [
        [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
        [1,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1],
        [1,0,1,0,1,0,1,1,1,0,1,0,1,1,1,0,1,0,1,1,1,0,1],
        [1,0,1,0,0,0,1,0,0,0,0,0,1,0,1,0,0,0,1,0,1,0,1],
        [1,0,1,1,1,1,1,0,1,1,1,1,1,0,1,1,1,0,1,0,1,0,1],
        [1,0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,1,0,0,0,1,0,1],
        [1,1,1,1,1,0,1,0,1,0,1,1,1,1,1,0,1,1,1,1,1,0,1],
        [1,0,0,0,1,0,0,0,1,0,1,0,0,0,1,0,0,0,0,0,1,0,1],
        [1,0,1,0,1,1,1,1,1,0,1,0,1,0,1,1,1,1,1,0,1,0,1],
        [1,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,1],
        [1,0,1,1,1,0,1,1,0,0,0,0,0,0,1,1,0,1,1,1,1,0,1],
        [1,0,0,0,1,0,1,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,1],
        [1,1,1,0,1,0,1,0,0,0,0,0,0,0,0,1,0,1,0,1,1,1,1],
        [1,0,0,0,1,0,1,1,0,0,0,0,0,0,1,1,0,1,0,0,0,0,1],
        [1,0,1,1,1,0,0,0,1,0,0,0,0,0,1,0,0,0,1,1,1,0,1],
        [1,0,1,0,0,0,1,0,1,1,1,1,1,1,1,0,1,0,0,0,1,0,1],
        [1,0,1,0,1,1,1,0,0,0,0,0,0,0,0,0,1,1,1,0,1,0,1],
        [1,0,0,0,1,0,0,0,1,1,1,0,1,1,1,0,0,0,1,0,0,0,1],
        [1,1,1,0,1,0,1,1,1,0,1,0,1,0,1,1,1,0,1,0,1,1,1],
        [1,0,0,0,1,0,1,0,0,0,1,0,1,0,0,0,1,0,1,0,0,0,1],
        [1,0,1,1,1,0,1,0,1,1,1,0,1,1,1,0,1,0,1,1,1,0,1],
        [1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1],
        [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
    ]
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                let side = min(geo.size.width, geo.size.height)
                let rows = mazeGrid.count
                let cols = mazeGrid[0].count
                let cellWidth = side / CGFloat(cols)
                let cellHeight = side / CGFloat(rows)
                
                ZStack {
                    Color.black
                    Path { path in
                        for r in 0..<rows {
                            for c in 0..<cols {
                                if mazeGrid[r][c] == 1 {
                                    path.addRect(CGRect(
                                        x: CGFloat(c) * cellWidth,
                                        y: CGFloat(r) * cellHeight,
                                        width: cellWidth + 0.5,
                                        height: cellHeight + 0.5
                                    ))
                                }
                            }
                        }
                    }
                    .fill(MazeTheme.mazeWall)
                }
                .frame(width: side, height: side)
                .position(x: geo.size.width / 2, y: geo.size.height / 2)
            }
            
            Text("YOU ARE HERE")
                .font(.title3)
                .bold()
                .foregroundColor(MazeTheme.badgeText)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.4), radius: 6, x: 0, y: 3)
        }
        .aspectRatio(1.0, contentMode: .fit)
        .overlay(Rectangle().stroke(MazeTheme.mazeWall, lineWidth: 3))
    }
}

#Preview {
    MazeComponentView()
}
