//
//  AllInOneMazeRunnerView.swift
//  TheMazeRunner
//
//  Self-contained single-file implementation for instant Xcode preview testing.
//

import SwiftUI

enum MazeTheme {
    static let backgroundDark = Color(red: 11/255, green: 11/255, blue: 23/255) // #0B0B17
    static let headerBackground = Color(red: 42/255, green: 39/255, blue: 64/255) // #2A2740
    static let tabBarBackground = Color(red: 42/255, green: 39/255, blue: 64/255) // #2A2740
    static let mazeWall = Color(red: 123/255, green: 117/255, blue: 165/255) // #7B75A5
    static let textMuted = Color(red: 111/255, green: 107/255, blue: 138/255) // #6F6B8A
    static let tabActive = Color(red: 236/255, green: 234/255, blue: 246/255) // #ECEAF6
    static let tabInactive = Color(red: 93/255, green: 89/255, blue: 122/255)  // #5D597A
    static let divider = Color(red: 62/255, green: 58/255, blue: 90/255) // #3E3A5A
    static let badgeText = Color(red: 70/255, green: 67/255, blue: 102/255) // #464366
}

enum AppTab: Hashable {
    case home, greenies
}

