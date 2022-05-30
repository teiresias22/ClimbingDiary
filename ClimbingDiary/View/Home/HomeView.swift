//
//  HomeView.swift
//  ClimbingDiary
//
//  Created by Joonhwan Jeon on 2022/05/30.
//

import UIKit
import SnapKit
import Then

class HomeView: UIView, ViewRepresentable {
    let topView = UIView().then {
        $0.backgroundColor = .gray
        $0.layer.cornerRadius = 8
    }
    
    let userNameLabel = UILabel().then {
        $0.text = "SwiftUser"
    }
    
    let userImage = UIImageView().then {
        $0.backgroundColor = .systemCyan
        $0.layer.cornerRadius = 20
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 2
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
        addSubview(topView)
        topView.addSubview(userNameLabel)
        topView.addSubview(userImage)
    }
    
    func setupConstraints() {
        topView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(8)
            make.leading.trailing.equalToSuperview().inset(8)
            make.height.equalTo(60)
        }
        
        userNameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(8)
        }
        
        userImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(8)
            make.width.height.equalTo(40)
        }
    }
}
