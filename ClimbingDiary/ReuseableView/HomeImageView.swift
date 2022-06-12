//
//  HomeImageView.swift
//  ClimbingDiary
//
//  Created by Joonhwan Jeon on 2022/05/31.
//

import UIKit
import SnapKit
import Then

class HomeImageView: UIView, ViewRepresentable {
    let label = UILabel().then {
        $0.textColor = .black
        $0.text = "@@@@@@@@"
    }
    
    let image = UIImageView().then {
        $0.backgroundColor = .gray
        $0.layer.cornerRadius = 8
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupView() {
        addSubview(label)
        addSubview(image)
    }
    
    func setupConstraints() {
        label.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(8)
            $0.height.equalTo(20)
        }
        image.snp.makeConstraints {
            $0.top.equalTo(label.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(8)
            $0.bottom.equalToSuperview().inset(8)
        }
    }
}

