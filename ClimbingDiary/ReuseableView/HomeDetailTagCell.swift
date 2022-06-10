//
//  HomeDetailTagCell.swift
//  ClimbingDiary
//
//  Created by Joonhwan Jeon on 2022/06/03.
//

import UIKit
import SnapKit
import Then

class HomeDetailTagCell: UICollectionViewCell{
    static let identifier = "HomeDetailTagCell"
    
    let label = UILabel().then {
        $0.text = "@@@@@@"
        $0.layer.cornerRadius = 8
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
        $0.backgroundColor = .systemGray6
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
