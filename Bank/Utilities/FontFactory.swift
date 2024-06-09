//
//  ExStaticFunctions.swift
//  Bank
//
//  Created by Ian Fan on 2024/6/8.
//

import Foundation
import UIKit

enum FontEnum: String {
    case DEFAULT
    case Helvetica
    case HelveticaBold
    case HelveticaNeue
    case HelveticaNeueMedium
    case HelveticaNeueBold
    case HelveticaNeueBoldItalic
    case SFProTextMedium
    case SFProTextBold
    case SFProTextRegular
    
    init?(rawValue _: String) {
        return nil
    }

    var rawValue: String {
        switch self {
        case .DEFAULT: return "DEFAULT"
        case .Helvetica: return "Helvetica"
        case .HelveticaBold: return "Helvetica-Bold"
        case .HelveticaNeue: return "HelveticaNeue"
        case .HelveticaNeueMedium: return "HelveticaNeue-Medium"
        case .HelveticaNeueBold: return "HelveticaNeue-Bold"
        case .HelveticaNeueBoldItalic: return "HelveticaNeue-BoldItalic"
        case .SFProTextMedium: return "SFProText-Medium"
        case .SFProTextBold: return "SFProText-Bold"
        case .SFProTextRegular: return "SFProText-Regular"
        }
    }
}
