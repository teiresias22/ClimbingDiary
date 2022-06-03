//
//  Enums.swift
//  ClimbingDiary
//
//  Created by Joonhwan Jeon on 2022/06/04.
//

import Foundation
import UIKit

enum HomeViews {
    case mainSection
    case firstView
    case secondView
    case therdView
    case forthView
    
    var text : String {
        switch self {
        case .mainSection: return "이벤트중인 암장"
        case .firstView: return "인기 암장"
        case .secondView: return "신규 암장"
        case .therdView: return "추천 암장"
        case .forthView: return "신규 세팅 암장"
        }
    }
    
    var color : UIColor { //추후에 이미지로 변경할 예정
        switch self {
            case .mainSection: return .systemCyan
            case .firstView: return .systemRed
            case .secondView: return .systemBlue
            case .therdView: return .systemMint
            case .forthView: return .systemPink
        }
    }
}
