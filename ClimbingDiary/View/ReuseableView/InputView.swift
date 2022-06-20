//
//  InputView.swift
//  ClimbingDiary
//
//  Created by Joonhwan Jeon on 2022/06/18.
//

import UIKit
import SnapKit
import Then

final class InputView: UIView, ViewRepresentable {
    let stackView = UIStackView().then {
        $0.spacing = 20
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fill
        $0.backgroundColor = .customGray4
        $0.layer.cornerRadius = 8
    }
    
    let titleLabel = UILabel().then {
        $0.text = "@@@@@@@@"
        $0.textColor = .customBlack
        $0.textAlignment = .center
    }
    
    let outputLabel = UILabel().then {
        $0.text = "########"
        $0.textColor = .customBlack
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
        addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(outputLabel)
    }
    
    func setupConstraints() {
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.width.equalTo(80)
        }
    }
}
