//
//  HomeDetailTagCell.swift
//  ClimbingDiary
//
//  Created by Joonhwan Jeon on 2022/06/03.
//

import UIKit
import SnapKit
import Then

final class HomeDetailTagCell: UICollectionViewCell{
    static let identifier = "HomeDetailTagCell"
    
    let label = UILabel().then {
        $0.text = "@@@@@@"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    func setViews() {
        addSubview(label)
    }
    
    func setConstraints() {
        label.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview().inset(4)
        }
    }
}
