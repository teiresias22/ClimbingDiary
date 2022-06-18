//
//  HomeDetailImageCell.swift
//  ClimbingDiary
//
//  Created by Joonhwan Jeon on 2022/06/03.
//


import UIKit
import SnapKit
import Then

final class HomeDetailImageCell: UICollectionViewCell{
    static let identifier = "HomeDetailImageCell"
    
    let image = UIImageView().then {
        $0.backgroundColor = .customGray4
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
        addSubview(image)
    }
    
    func setConstraints() {
        image.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
    }
}
