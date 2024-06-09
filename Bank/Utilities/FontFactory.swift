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
    case ArialRoundedMTBold
    case ArialBoldItalicMT
    case Big_Snow
    case ChalkboardSEBold
    case Helvetica
    case HelveticaBold
    case HelveticaNeue
    case HelveticaNeueMedium
    case HelveticaNeueBold
    case HelveticaNeueBoldItalic
    case HiraMinProN
    case HoeflerTextBlack
    case HoeflerTextBlackItalic
    case PingFangHKMedium
    case PingFangSCRegular
    case PingFangSCMedium
    case PingFangSC_Semibold
    case PingFangTC_Semibold
    case RobotoBold
    case RobotoMedium
    case RobotoRegular
    case RoundedMplus1c_Medium
    case RoundedMplus1c_Bold
    case SFUITextMedium
    case SFUITextSemibold
    case SFDisplay_Semibold
    case SFDisplay_Regular
    case SFText_Bold
    case SFText_Regular
    case SFText_SemiBold
    case SFText_Medium
    case SFDisplay_Bold
    case Slidechunfeng_Regular
    case SourceCodePro_Regular
    case ThonburiBold
    case Thonburi
    case TimesNewRomanBold
    
    
    init?(rawValue _: String) {
        return nil
    }

    var rawValue: String {
        switch self {
        case .DEFAULT: return "DEFAULT"
        case .ArialRoundedMTBold: return "ArialRoundedMTBold"
        case .ArialBoldItalicMT: return "Arial-BoldItalicMT"
        case .Big_Snow: return "Big-Snow"
        case .ChalkboardSEBold: return "ChalkboardSE-Bold"
        case .Helvetica: return "Helvetica"
        case .HelveticaBold: return "Helvetica-Bold"
        case .HelveticaNeue: return "HelveticaNeue"
        case .HelveticaNeueMedium: return "HelveticaNeue-Medium"
        case .HelveticaNeueBold: return "HelveticaNeue-Bold"
        case .HelveticaNeueBoldItalic: return "HelveticaNeue-BoldItalic"
        case .HiraMinProN: return "HiraMinProN-W6"
        case .HoeflerTextBlack: return "HoeflerText-Black"
        case .HoeflerTextBlackItalic: return "HoeflerText-BlackItalic"
        case .PingFangHKMedium: return "PingFangHK-Medium"
        case .PingFangSCMedium: return "PingFangSC-Medium"
        case .PingFangSCRegular: return "PingFangSC-Regular"
        case .PingFangSC_Semibold: return "PingFangSC-Semibold"
        case .PingFangTC_Semibold: return "PingFangTC-Semibold"
        case .RobotoBold: return "HelveticaNeue-Bold"
        case .RobotoMedium: return "HelveticaNeue-Medium"
        case .RobotoRegular: return "HelveticaNeue"
        case .RoundedMplus1c_Bold: return "RoundedMplus1c-Bold"
        case .RoundedMplus1c_Medium: return "RoundedMplus1c-Medium"
        case .SFDisplay_Semibold: return "SanFranciscoDisplay-Semibold"
        case .SFText_Bold: return "SanFranciscoText-Bold"
        case .SFText_Regular: return "SanFranciscoText-Regular"
        case .SFText_SemiBold: return "SanFranciscoText-Semibold"
        case .SFText_Medium: return "SanFranciscoText-Medium"
        case .SFUITextMedium: return "PingFangHK-Medium"
        case .SFUITextSemibold: return "PingFangHK-Semibold"
        case .SFDisplay_Bold: return "SanFranciscoDisplay-Bold"
        case .SFDisplay_Regular: return "SanFranciscoDisplay-Regular"
        case .Slidechunfeng_Regular: return "Slidechunfeng-Regular"
        case .SourceCodePro_Regular: return "SourceCodePro-Regular"
        case .ThonburiBold: return "Thonburi-Bold"
        case .Thonburi: return "Thonburi"
        case .TimesNewRomanBold: return "TimesNewRomanPS-BoldMT"
        }
    }
}
