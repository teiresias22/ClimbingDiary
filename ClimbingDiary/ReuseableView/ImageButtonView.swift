//
//  ImageButtonView.swift
//  ClimbingDiary
//
//  Created by Joonhwan Jeon on 2022/06/02.
//

import UIKit
import SnapKit
import Then

class ImageButtonView: UIView, ViewRepresentable {
    let image = UIImageView().then {
        $0.backgroundColor = .gray
        $0.layer.cornerRadius = 8
    }
    
    let label = UILabel().then {
        $0.textColor = .gray
        $0.text = "@@@@@@"
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
        addSubview(image)
        addSubview(label)
    }
    
    func setupConstraints() {
        image.snp.makeConstraints {
            $0.top.equalToSuperview().inset(4)
            $0.leading.trailing.equalToSuperview().inset(4)
            $0.bottom.equalTo(label.snp.top).offset(4)
        }
        
        label.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(8)
            $0.bottom.equalToSuperview().inset(4)
            $0.height.equalTo(20)
        }
    }
}
