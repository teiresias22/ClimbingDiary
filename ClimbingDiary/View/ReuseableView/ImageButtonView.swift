//
//  ImageButtonView.swift
//  ClimbingDiary
//
//  Created by Joonhwan Jeon on 2022/06/02.
//

import UIKit
import SnapKit
import Then

final class ImageButtonView: UIView, ViewRepresentable {
    let image = UIImageView().then {
        $0.tintColor = .customBlack
    }
    
    let label = UILabel().then {
        $0.textColor = .customGray4
        $0.text = "@@@@@@"
        $0.textAlignment = .center
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
        label.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(8)
            $0.bottom.equalToSuperview().inset(4)
            $0.height.equalTo(20)
        }
        
        image.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-10)
            $0.size.width.equalTo(50)
        }
    }
}
