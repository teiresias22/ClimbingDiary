//
//  TextButtonView.swift
//  ClimbingDiary
//
//  Created by Joonhwan Jeon on 2022/06/02.
//

import UIKit
import SnapKit
import Then

class TextButtonView: UIView, ViewRepresentable {
    let text = UILabel().then {
        $0.textColor = .black
        $0.adjustsFontSizeToFitWidth = true
        $0.textAlignment = .center
        $0.backgroundColor = .systemGray6
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
        addSubview(text)
        addSubview(label)
    }
    
    func setupConstraints() {
        text.snp.makeConstraints {
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
