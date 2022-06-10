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
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.collectionViewLayout = CollectionViewLeftAlignFlowLayout()
        
        if let flowLayout = view.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
        
        return view
    }()
    
    let scrollView = UIScrollView().then {
        $0.backgroundColor = .gray
        $0.showsVerticalScrollIndicator = false
    }
       
    let topView = UIView().then {
        $0.backgroundColor = .systemGray2
    }
    
    let topViewTitle = UILabel().then {
        $0.text = "@@@@@@@@"
    }
    
    let topViewSubTitle = UILabel().then {
        $0.text = "@@@@"
    }
    
    let buttonsStackView = UIStackView().then {
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
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.collectionViewLayout = CollectionViewLeftAlignFlowLayout()
        view.backgroundColor = .systemPink
        
        if let flowLayout = view.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
        
        return view
    }()
    
    let moreInfoView = UIView().then {
        $0.backgroundColor = .gray
    }
    
    let moreInfoViewTopLabel = UILabel().then {
        $0.text = "@@@@@@@"
    }
    
    let moreInfoViewBottomLabel = UILabel().then {
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
        $0.backgroundColor = .systemGray
        $0.layer.cornerRadius = 8
    }
    
    let shareButton = UIButton().then {
        $0.tintColor = .white
        $0.backgroundColor = .systemGray2
        $0.layer.cornerRadius = 8
    }
    
    let siteButton = UIButton().then {
        $0.tintColor = .white
        $0.backgroundColor = .systemGray3
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
        addSubview(imageSliderView)
        addSubview(scrollView)
        scrollView.addSubview(topView)
        topView.addSubview(topViewTitle)
        topView.addSubview(topViewSubTitle)
        
        scrollView.addSubview(buttonsStackView)
        buttonsStackView.addArrangedSubview(locationButton)
        buttonsStackView.addArrangedSubview(sectorButton)
        buttonsStackView.addArrangedSubview(openHourButton)
        buttonsStackView.addArrangedSubview(callButton)
        
        scrollView.addSubview(tagCollectionView)
        
        scrollView.addSubview(moreInfoView)
        moreInfoView.addSubview(moreInfoViewTopLabel)
        moreInfoView.addSubview(moreInfoViewBottomLabel)
        
        scrollView.addSubview(bottomStackView)
        bottomStackView.addArrangedSubview(reservationButton)
        bottomStackView.addArrangedSubview(shareButton)
        bottomStackView.addArrangedSubview(siteButton)
    }
    
    func setupConstraints() {
        imageSliderView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(200)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(imageSliderView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
        
        topView.snp.makeConstraints {
            $0.top.equalTo(scrollView.snp.top).inset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(120)
        }
        
        topViewTitle.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(8)
            $0.height.equalTo(32)
        }
        
        topViewSubTitle.snp.makeConstraints {
            $0.top.equalTo(topViewTitle.snp.bottom).offset(-8)
            $0.leading.trailing.bottom.equalToSuperview().inset(20)
        }
        
        buttonsStackView.snp.makeConstraints {
            $0.top.equalTo(topView.snp.bottom).offset(-20)
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.height.equalTo(80)
        }
        
        tagCollectionView.snp.makeConstraints {
            $0.top.equalTo(buttonsStackView.snp.bottom).offset(-20)
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.height.equalTo(120)
        }
        
        moreInfoView.snp.makeConstraints {
            $0.top.equalTo(tagCollectionView.snp.bottom).offset(-20)
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.height.equalTo(80)
        }
        
        moreInfoViewTopLabel.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(8)
            $0.height.equalTo(28)
        }
        
        moreInfoViewBottomLabel.snp.makeConstraints {
            $0.top.equalTo(moreInfoViewTopLabel.snp.bottom).offset(-8)
            $0.leading.trailing.bottom.equalToSuperview().inset(8)
        }
        
        bottomStackView.snp.makeConstraints {
            $0.top.equalTo(moreInfoView.snp.bottom).offset(-20)
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.bottom.equalToSuperview().inset(20)
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
