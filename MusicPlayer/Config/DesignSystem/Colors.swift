//
//  Colors.swift
//  MusicPlayer
//
//  Created by Mufallah FD on 07/03/25.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
    
    static let rockBlue = Color(hex: "#9DA8CD")
    static let shipCove = Color(hex: "#7C8BBF")
    static let manatee = Color(hex: "#8989AC")
    static let fiord = Color(hex: "#454E6A")
    static let ultramarine = Color(hex: "#0B0897")
    static let cloudBurst = Color(hex: "#20225D")
    static let stratos = Color(hex: "#07014F")
    static let blackRock = Color(hex: "#020326")
}
