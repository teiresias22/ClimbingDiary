//
//  HomeDetailCell.swift
//  ClimbingDiary
//
//  Created by Joonhwan Jeon on 2022/06/21.
//

import UIKit
import SnapKit
import Then

final class HomeDetailCell: UITableViewCell {
    static let identifier = "HomeDetailCell"
    
    let title = UILabel().then {
        $0.text = "@@@@@@@@"
        $0.textColor = .customBlack
    }
    
    let subTitle = UILabel().then {
        $0.text = "@@@@@@@@"
        $0.textColor = .customGray4
        $0.numberOfLines = 0
    }
    
    let gradeLabel = UILabel().then {
        $0.text = "난이도표"
        $0.textColor = .customBlack
    }
    
    let gradeCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.isPagingEnabled = true
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setViews() {
        addSubview(title)
        addSubview(subTitle)
        addSubview(gradeLabel)
        addSubview(gradeCollectionView)
    }
    
    func setConstraints() {
        title.snp.makeConstraints {
            $0.top.equalToSuperview().inset(8)
            $0.leading.trailing.equalToSuperview().inset(8)
            $0.height.equalTo(24)
        }
        
        gradeCollectionView.snp.makeConstraints {
            $0.bottom.leading.trailing.equalToSuperview()
            $0.height.equalTo(40)
        }
        
        gradeLabel.snp.makeConstraints {
            $0.bottom.equalTo(gradeCollectionView.snp.top).offset(-8)
            $0.leading.trailing.equalToSuperview().inset(8)
            $0.height.equalTo(20)
        }
        
        subTitle.snp.makeConstraints {
            $0.top.equalTo(title.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().inset(12)
            $0.bottom.equalTo(gradeLabel.snp.top).offset(-12)
        }
    }
}

extension HomeDetailCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: gradeCollectionViewCell.reuseIdentifier, for: indexPath) as? gradeCollectionViewCell else { return UICollectionViewCell() }
                    
        item.backgroundColor = .customGray7
        return item
    }
    
    
}
