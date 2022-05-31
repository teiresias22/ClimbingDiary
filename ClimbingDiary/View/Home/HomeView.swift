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
    
    let vStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 8
        $0.alignment = .fill
        $0.distribution = .fillEqually
    }
    
    let mainSectionView = HomeImageView()
    
    let firstHStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillEqually
    }
    
    let firstSubView = HomeImageView()
    let secondSubView = HomeImageView()
    
    let secondHStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillEqually
    }
    
    let therdSubView = HomeImageView()
    let forthSubView = HomeImageView()
    
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
        
        addSubview(vStackView)
        vStackView.addArrangedSubview(mainSectionView)
        vStackView.addArrangedSubview(firstHStackView)
        vStackView.addArrangedSubview(secondHStackView)
        
        firstHStackView.addArrangedSubview(firstSubView)
        firstHStackView.addArrangedSubview(secondSubView)
        
        secondHStackView.addArrangedSubview(therdSubView)
        secondHStackView.addArrangedSubview(forthSubView)
    }
    
    func setupConstraints() {
        topView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(8)
            $0.leading.trailing.equalToSuperview().inset(8)
            $0.height.equalTo(60)
        }
        
        userNameLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
        }
        
        userImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(8)
            $0.width.height.equalTo(40)
        }
        
        vStackView.snp.makeConstraints {
            $0.top.equalTo(topView.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).offset(8)
        }
        
    }
}
