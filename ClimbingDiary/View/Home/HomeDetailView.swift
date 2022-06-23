//
//  HomeDetailView.swift
//  ClimbingDiary
//
//  Created by Joonhwan Jeon on 2022/06/02.
//

import UIKit
import SnapKit
import Then

class HomeDetailView: UIView, ViewRepresentable {
    let imageSliderView: UICollectionView = {
         let layout = UICollectionViewFlowLayout()
         layout.minimumLineSpacing = 0
         layout.minimumInteritemSpacing = 0
         layout.scrollDirection = .horizontal
         
         let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
         view.isPagingEnabled = true
         view.showsHorizontalScrollIndicator = false
         return view
     }()
    
    let progressView = UIProgressView().then {
        $0.trackTintColor = .customGray6
        $0.progressTintColor = .customWhite
    }
    
    let buttonStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 16
        $0.alignment = .fill
        $0.distribution = .fillEqually
    }
    
    let leftButton = UIButton().then {
        $0.backgroundColor = .customBlack
        $0.tintColor = .customWhite
        $0.setTitle("@@@@@@", for: .normal)
        $0.layer.cornerRadius = 20
    }
    
    let rightButton = UIButton().then {
        $0.backgroundColor = .customGray6
        $0.tintColor = .customGray2
        $0.setTitle("@@@@@@", for: .normal)
        $0.layer.cornerRadius = 20
    }
    
    let displayTableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func setupView() {
        addSubview(imageSliderView)
        addSubview(progressView)
        
        addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(leftButton)
        buttonStackView.addArrangedSubview(rightButton)
        
        addSubview(displayTableView)
        
    }
    
    func setupConstraints() {
        imageSliderView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(200)
        }
        
        progressView.snp.makeConstraints {
            $0.bottom.equalTo(imageSliderView.snp.bottom).offset(-20)
            $0.leading.equalTo(imageSliderView.snp.leading).inset(20)
            $0.trailing.equalTo(imageSliderView.snp.trailing).inset(20)
            $0.height.equalTo(2)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.top.equalTo(imageSliderView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(40)
        }
        
        displayTableView.snp.makeConstraints {
            $0.top.equalTo(buttonStackView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
    }
}
