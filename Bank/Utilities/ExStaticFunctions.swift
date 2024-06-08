//
//  ExStaticFunctions.swift
//  Bank
//
//  Created by Ian Fan on 2024/6/8.
//

import Foundation
import UIKit

enum FontEnum_pbn10: String {
    case DEFAULT_pbn10
    case ArialRoundedMTBold_pbn10
    case ArialBoldItalicMT_pbn10
    case Big_Snow
    case ChalkboardSEBold_pbn10
    case Helvetica_pbn10
    case HelveticaBold_pbn10
    case HelveticaNeue_pbn10
    case HelveticaNeueMedium_pbn10
    case HelveticaNeueBold_pbn10
    case HelveticaNeueBoldItalic_pbn10
    case HiraMinProN_pbn10
    case HoeflerTextBlack_pbn10
    case HoeflerTextBlackItalic_pbn10
//    case NotoSansMono_Bold
//    case NotoSansMono_Regular
//    case NotoSansMono_Medium
    case PingFangHKMedium_pbn10
    case PingFangSCRegular_pbn10
    case PingFangSCMedium_pbn10
    case PingFangSC_Semibold_pbn10
    case PingFangTC_Semibold_pbn10
    case RobotoBold_pbn10
    case RobotoMedium_pbn10
    case RobotoRegular_pbn10
    case RoundedMplus1c_Medium
    case RoundedMplus1c_Bold
    case SFUITextMedium_pbn10
    case SFUITextSemibold_pbn10
    case SFDisplay_Semibold
    case SFDisplay_Regular
    case SFText_Bold
    case SFText_Regular
    case SFText_SemiBold
    case SFText_Medium
    case SFDisplay_Bold
    case Slidechunfeng_Regular_pbn10
//    case SourceCodePro_Bold
    case SourceCodePro_Regular
//    case SourceCodePro_Medium
    case ThonburiBold_pbn10
    case Thonburi_pbn10
    case TimesNewRomanBold_pbn10
    
    
    init?(rawValue _: String) {
        return nil
    }

    var rawValue: String {
        switch self {
        case .DEFAULT_pbn10: return "DEFAULT"
        case .ArialRoundedMTBold_pbn10: return "ArialRoundedMTBold"
        case .ArialBoldItalicMT_pbn10: return "Arial-BoldItalicMT"
        case .Big_Snow: return "Big-Snow"
        case .ChalkboardSEBold_pbn10: return "ChalkboardSE-Bold"
        case .Helvetica_pbn10: return "Helvetica"
        case .HelveticaBold_pbn10: return "Helvetica-Bold"
        case .HelveticaNeue_pbn10: return "HelveticaNeue"
        case .HelveticaNeueMedium_pbn10: return "HelveticaNeue-Medium"
        case .HelveticaNeueBold_pbn10: return "HelveticaNeue-Bold"
        case .HelveticaNeueBoldItalic_pbn10: return "HelveticaNeue-BoldItalic"
        case .HiraMinProN_pbn10: return "HiraMinProN-W6"
        case .HoeflerTextBlack_pbn10: return "HoeflerText-Black"
        case .HoeflerTextBlackItalic_pbn10: return "HoeflerText-BlackItalic"
//        case .NotoSansMono_Bold: return "NotoSansMono-Bold"
//        case .NotoSansMono_Regular: return "NotoSansMono-Regular"
//        case .NotoSansMono_Medium: return "NotoSansMono-Medium"
        case .PingFangHKMedium_pbn10: return "PingFangHK-Medium"
        case .PingFangSCMedium_pbn10: return "PingFangSC-Medium"
        case .PingFangSCRegular_pbn10: return "PingFangSC-Regular"
        case .PingFangSC_Semibold_pbn10: return "PingFangSC-Semibold"
        case .PingFangTC_Semibold_pbn10: return "PingFangTC-Semibold"
        case .RobotoBold_pbn10: return "HelveticaNeue-Bold"
        case .RobotoMedium_pbn10: return "HelveticaNeue-Medium"
        case .RobotoRegular_pbn10: return "HelveticaNeue"
        case .RoundedMplus1c_Bold: return "RoundedMplus1c-Bold"
        case .RoundedMplus1c_Medium: return "RoundedMplus1c-Medium"
        case .SFDisplay_Semibold: return "SanFranciscoDisplay-Semibold"
        case .SFText_Bold: return "SanFranciscoText-Bold"
        case .SFText_Regular: return "SanFranciscoText-Regular"
        case .SFText_SemiBold: return "SanFranciscoText-Semibold"
        case .SFText_Medium: return "SanFranciscoText-Medium"
        case .SFUITextMedium_pbn10: return "PingFangHK-Medium"
        case .SFUITextSemibold_pbn10: return "PingFangHK-Semibold"
        case .SFDisplay_Bold: return "SanFranciscoDisplay-Bold"
        case .SFDisplay_Regular: return "SanFranciscoDisplay-Regular"
        case .Slidechunfeng_Regular_pbn10: return "Slidechunfeng-Regular"
//        case .SourceCodePro_Bold: return "SourceCodePro-Bold"
//        case .SourceCodePro_Medium: return "SourceCodePro-Medium"
        case .SourceCodePro_Regular: return "SourceCodePro-Regular"
        case .ThonburiBold_pbn10: return "Thonburi-Bold"
        case .Thonburi_pbn10: return "Thonburi"
        case .TimesNewRomanBold_pbn10: return "TimesNewRomanPS-BoldMT"
        }
    }
}
