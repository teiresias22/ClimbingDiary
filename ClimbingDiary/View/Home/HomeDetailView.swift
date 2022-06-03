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
    let topCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.collectionViewLayout = CollectionViewLeftAlignFlowLayout()
        
        if let flowLayout = view.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
        
        return view
    }()
       
    let topView = UIView().then {
        $0.backgroundColor = .gray
    }
    
    let topTitleLabel = UILabel().then {
        $0.text = "@@@@@@@@"
    }
    
    let topSubTitleLabel = UILabel().then {
        $0.text = "@@@@"
    }
    
    let midleStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fill
    }
    
    let locationButton = ImageButtonView()
    let sectorButton = TextButtonView()
    let openHourButton = TextButtonView()
    let callButton = ImageButtonView()
    
    let tagCollectionView:  UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .systemPink
        
        return cv
    }()
    
    let bottomView = UIView().then {
        $0.backgroundColor = .gray
    }
    
    let bottomTitleLabel = UILabel().then {
        $0.text = "@@@@@@@"
    }
    
    let bottomSubLabel = UILabel().then {
        $0.text = "@@@@@@@"
    }
    
    let bottomStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 8
    }
    
    let reservationButton = UIButton().then {
        $0.tintColor = .white
        $0.backgroundColor = .gray
        $0.layer.cornerRadius = 8
    }
    
    let shareButton = UIButton().then {
        $0.tintColor = .white
        $0.backgroundColor = .gray
        $0.layer.cornerRadius = 8
    }
    
    let siteButton = UIButton().then {
        $0.tintColor = .white
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
        addSubview(topCollectionView)
        
        addSubview(topView)
        topView.addSubview(topTitleLabel)
        topView.addSubview(topSubTitleLabel)
        
        addSubview(midleStackView)
        midleStackView.addArrangedSubview(locationButton)
        midleStackView.addArrangedSubview(sectorButton)
        midleStackView.addArrangedSubview(openHourButton)
        midleStackView.addArrangedSubview(callButton)
        
        addSubview(tagCollectionView)
        
        addSubview(bottomView)
        bottomView.addSubview(bottomTitleLabel)
        bottomView.addSubview(bottomSubLabel)
        
        addSubview(bottomStackView)
        bottomStackView.addArrangedSubview(reservationButton)
        bottomStackView.addArrangedSubview(shareButton)
        bottomStackView.addArrangedSubview(siteButton)
    }
    
    func setupConstraints() {
        topCollectionView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).inset(8)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(200)
        }
        
        topView.snp.makeConstraints {
            $0.top.equalTo(topCollectionView.snp.bottom).offset(-16)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(80)
        }
        
        topTitleLabel.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(30)
        }
        
        topSubTitleLabel.snp.makeConstraints {
            $0.top.equalTo(topTitleLabel.snp.top).offset(-10)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        midleStackView.snp.makeConstraints {
            $0.top.equalTo(topView.snp.bottom).offset(-8)
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.height.equalTo(60)
        }
        
        locationButton.snp.makeConstraints {
            $0.width.equalTo(60)
        }
        
        sectorButton.snp.makeConstraints {
            $0.width.equalTo(60)
        }
        
        openHourButton.snp.makeConstraints {
            $0.width.equalTo(60)
        }
        
        callButton.snp.makeConstraints {
            $0.width.equalTo(60)
        }
        
        tagCollectionView.snp.makeConstraints {
            $0.top.equalTo(midleStackView.snp.bottom).offset(-8)
            $0.width.equalTo(midleStackView.snp.width)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(120)
        }
        
        bottomView.snp.makeConstraints {
            $0.top.equalTo(tagCollectionView.snp.bottom).offset(-8)
            $0.width.equalTo(midleStackView.snp.width)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(72)
        }
        
        bottomTitleLabel.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(8)
            $0.height.equalTo(24)
        }
        
        bottomSubLabel.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview().inset(8)
            $0.height.equalTo(24)
        }
        
        bottomStackView.snp.makeConstraints {
            $0.top.equalTo(bottomView.snp.bottom).offset(-8)
            $0.width.equalTo(midleStackView.snp.width)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(40)
        }
        
        shareButton.snp.makeConstraints {
            $0.width.equalTo(60)
        }
        
        siteButton.snp.makeConstraints {
            $0.width.equalTo(60)
        }
    }
}

class CollectionViewLeftAlignFlowLayout: UICollectionViewFlowLayout {
    let cellSpacing: CGFloat = 8
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        self.minimumLineSpacing = 8.0
        self.sectionInset = UIEdgeInsets(top: 5.0, left: 16.0, bottom: 5.0, right: 16.0)
        let attributes = super.layoutAttributesForElements(in: rect)
 
        var leftMargin = sectionInset.left
        var maxY: CGFloat = -1.0
        attributes?.forEach { layoutAttribute in
            if layoutAttribute.frame.origin.y >= maxY {
                leftMargin = sectionInset.left
            }
            layoutAttribute.frame.origin.x = leftMargin
            leftMargin += layoutAttribute.frame.width + cellSpacing
            maxY = max(layoutAttribute.frame.maxY, maxY)
        }
        return attributes
    }
}
