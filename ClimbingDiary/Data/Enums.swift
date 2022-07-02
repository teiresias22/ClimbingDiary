//
//  Enums.swift
//  ClimbingDiary
//
//  Created by Joonhwan Jeon on 2022/06/04.
//

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

enum mapType: Int {
    case standard = 0 //기본형태
    case staelite = 1 //위성형태
    case hybrid = 2 //하이브리드
}

enum MyItems: Equatable {
    case collection([CollectionViewItem])
}

enum CollectionViewItem: Equatable {
    case color(UIColor)
    case text(String)
    case subTitle(String)
}

enum MenuList: String {
    case menu1 = "공지사항"
    case menu2 = "오픈라이센스"
    case menu3 = "문의하기"
    case menu4 = "개인정보 처리방침"
    case menu5 = "서비스 이용 약관"
    case menu6 = "버전정보"
}
