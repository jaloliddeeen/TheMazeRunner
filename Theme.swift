//
//  Theme.swift
//  TheMazeRunner
//
//  Created by Jaloliddin Esonboyev on 19/11/2026.
//

import SwiftUI

enum MazeTheme {
    
    static let backgroundDark = Color(red: 11/255, green: 11/255, blue: 23/255)
    
    static let headerBackground = Color(red: 44/255, green: 43/255, blue: 66/255)
    static let tabBarBackground = Color(red: 44/255, green: 43/255, blue: 66/255)
    
    static let mazeWall = Color(red: 125/255, green: 120/255, blue: 168/255)
    static let textMuted = Color(red: 120/255, green: 117/255, blue: 148/255)
    
    static let tabInactive = Color(red: 105/255, green: 101/255, blue: 130/255)
    static let tabActive = Color(red: 235/255, green: 233/255, blue: 247/255)
    
    static let divider = Color(red: 70/255, green: 66/255, blue: 99/255)
    static let badgeText = Color(red: 70/255, green: 67/255, blue: 102/255)
}

enum AppTab: Hashable {
    case home, greenies
}
