//
//  Typography.swift
//  MusicPlayer
//
//  Created by Mufallah FD on 07/03/25.
//

import SwiftUI

private enum FontType: String {
    case montserrat
    case josefinSans
    case poppins
    case openSans
    case sourceSansPro
    case nunito
    case inter
    
    var name: String {
        self.rawValue.capitalized
    }
}
private enum FontWeight: String {
    case extraLight
    case light
    case thin
    case regular
    case medium
    case semiBold
    case bold
    case extraBold
    case black
    
    case extraLightItalic
    case lightItalic
    case thinItalic
    case regularItalic
    case mediumItalic
    case semiBoldItalic
    case boldItalic
    case extraBoldItalic
    case blackItalic
    
    var name: String {
        "-" + self.rawValue.capitalized
    }
}

// Custom Font Methods
@available(iOS 14, *)
extension Font {
    /// Use this method for custom fonts with variable weight and style.
    /// Dynamically updates the font size with the system size.
    /// - Parameters:
    ///   - type: Cases that describe the preferred type of font.
    ///   - weight: Cases that describe the preferred weight for fonts.
    ///   - style: Constants that describe the preferred styles for fonts.
    /// - Returns: Custom font based on the parameters you specified.
    static private func font(type: FontType, weight: FontWeight, style: UIFont.TextStyle) -> Font {
        .custom(type.name + weight.name, size: UIFont.preferredFont(forTextStyle: style).pointSize)
    }
    
    /// Use this method for custom fonts with variable weight and size.
    /// Dynamically updates the font size with the system size.
    /// - Parameters:
    ///   - type: Cases that describe the preferred type of font.
    ///   - weight: Cases that describe the preferred weight for fonts.
    ///   - size: Constants that describe the preferred size for fonts.
    /// - Returns: Custom font based on the parameters you specified.
    static private func font(type: FontType, weight: FontWeight, size: CGFloat) -> Font {
        .custom(type.name + weight.name, size: size)
    }
}

// Custom Fonts Naming
@available(iOS 14, *)
extension Font {
    //size 12
    static let regular12 = font(type: .inter, weight: .regular, size: 12)
    static let medium12 = font(type: .inter, weight: .medium, size: 12)
    static let semibold12 = font(type: .inter, weight: .semiBold, size: 12)
    static let bold12 = font(type: .inter, weight: .bold, size: 12)
   
    //size 14
    static let regular14 = font(type: .inter, weight: .regular, size: 14)
    static let medium14 = font(type: .inter, weight: .medium, size: 14)
    static let semibold14 = font(type: .inter, weight: .semiBold, size: 14)
    static let bold14 = font(type: .inter, weight: .bold, size: 14)
    
    //size 16
    static let regular16 = font(type: .inter, weight: .regular, size: 16)
    static let medium16 = font(type: .inter, weight: .medium, size: 16)
    static let semibold16 = font(type: .inter, weight: .semiBold, size: 16)
    static let bold16 = font(type: .inter, weight: .bold, size: 16)
    
    //size 18
    static let regular18 = font(type: .inter, weight: .regular, size: 18)
    static let medium18 = font(type: .inter, weight: .medium, size: 18)
    static let semibold18 = font(type: .inter, weight: .semiBold, size: 18)
    static let bold18 = font(type: .inter, weight: .bold, size: 18)
    
    //size 20
    static let regular20 = font(type: .inter, weight: .regular, size: 20)
    static let medium20 = font(type: .inter, weight: .medium, size: 20)
    static let semibold20 = font(type: .inter, weight: .semiBold, size: 20)
    static let bold20 = font(type: .inter, weight: .bold, size: 20)
    
    //size 23
    static let regular23 = font(type: .inter, weight: .regular, size: 23)
    static let medium23 = font(type: .inter, weight: .medium, size: 23)
    static let semibold23 = font(type: .inter, weight: .semiBold, size: 23)
    static let bold23 = font(type: .inter, weight: .bold, size: 23)
    
    //size 26
    static let regular26 = font(type: .inter, weight: .regular, size: 26)
    static let medium26 = font(type: .inter, weight: .medium, size: 26)
    static let semibold26 = font(type: .inter, weight: .semiBold, size: 26)
    static let bold26 = font(type: .inter, weight: .bold, size: 26)
    
    //size 29
    static let regular29 = font(type: .inter, weight: .regular, size: 29)
    static let medium29 = font(type: .inter, weight: .medium, size: 29)
    static let semibold29 = font(type: .inter, weight: .semiBold, size: 29)
    static let bold29 = font(type: .inter, weight: .bold, size: 29)
    
    //size 32
    static let regular32 = font(type: .inter, weight: .regular, size: 32)
    static let medium32 = font(type: .inter, weight: .medium, size: 32)
    static let semibold32 = font(type: .inter, weight: .semiBold, size: 32)
    static let bold32 = font(type: .inter, weight: .bold, size: 32)
}
