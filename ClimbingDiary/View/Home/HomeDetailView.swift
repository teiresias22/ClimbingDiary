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
    
    let menuSliderView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 16
        layout.scrollDirection = .horizontal
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.isPagingEnabled = false
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
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
        addSubview(menuSliderView)
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
        
        menuSliderView.snp.makeConstraints {
            $0.top.equalTo(imageSliderView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        displayTableView.snp.makeConstraints {
            $0.top.equalTo(menuSliderView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
    }
}
