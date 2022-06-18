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
    
    let scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = false
    }
    
    let contentView = UIView().then {
        $0.backgroundColor = .customWhite
    }
    
    let topView = UIView()
    
    let topViewTitle = UILabel().then {
        $0.text = "@@@@@@@@"
        $0.textColor = .customBlack
        $0.font = .systemFont(ofSize: 24)
    }
    
    let topViewSubTitle = UILabel().then {
        $0.text = "@@@@"
        $0.textColor = .customBlack
        $0.numberOfLines = 0
    }
    
    let buttonsStackView = UIStackView().then {
        $0.spacing = 8
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillEqually
    }
    
    let locationButton = ImageButtonView().then {
        $0.image.image = UIImage(systemName: "mappin.circle")
        $0.label.text = "위치"
    }

    let sectorButton = TextButtonView().then {
        $0.label.text = "섹터"
    }
    
    let openHourButton = TextButtonView()
    
    let callButton = ImageButtonView().then {
        $0.image.image = UIImage(systemName: "phone.circle")
        $0.label.text = "전화"
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
    
    let tagCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.collectionViewLayout = CollectionViewLeftAlignFlowLayout()
        view.layer.cornerRadius = 8
        view.layer.borderColor = UIColor.customBlack?.cgColor
        view.layer.borderWidth = 1
        view.backgroundColor = .customWhite
        
        if let flowLayout = view.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
        
        return view
    }()
    
    let moreInfoView = UIView()
    
    let moreInfoViewTopLabel = UILabel().then {
        $0.text = "@@@@@@@"
        $0.textColor = .customBlack
    }
    
    let moreInfoViewBottomLabel = UILabel().then {
        $0.text = "@@@@@@@"
        $0.textColor = .customBlack
    }
    
    let bottomStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 8
    }
    
    let reservationButton = UIButton().then {
        $0.setTitle("예약", for: .normal)
        $0.tintColor = .customWhite
        $0.backgroundColor = .customGray4
        $0.layer.cornerRadius = 8
    }
    
    let shareButton = UIButton().then {
        $0.setTitle("공유", for: .normal)
        $0.tintColor = .customWhite
        $0.backgroundColor = .customGray4
        $0.layer.cornerRadius = 8
    }
    
    let siteButton = UIButton().then {
        $0.setTitle("사이트", for: .normal)
        $0.tintColor = .customWhite
        $0.backgroundColor = .customGray4
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
        addSubview(progressView)
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(topView)
        topView.addSubview(topViewTitle)
        topView.addSubview(topViewSubTitle)
        
        contentView.addSubview(buttonsStackView)
        buttonsStackView.addArrangedSubview(locationButton)
        buttonsStackView.addArrangedSubview(sectorButton)
        buttonsStackView.addArrangedSubview(openHourButton)
        buttonsStackView.addArrangedSubview(callButton)
        
        contentView.addSubview(gradeCollectionView)
        
        contentView.addSubview(tagCollectionView)
        
        contentView.addSubview(moreInfoView)
        moreInfoView.addSubview(moreInfoViewTopLabel)
        moreInfoView.addSubview(moreInfoViewBottomLabel)
        
        contentView.addSubview(bottomStackView)
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
        
        progressView.snp.makeConstraints {
            $0.bottom.equalTo(imageSliderView.snp.bottom).offset(-20)
            $0.leading.equalTo(imageSliderView.snp.leading).inset(20)
            $0.trailing.equalTo(imageSliderView.snp.trailing).inset(20)
            $0.height.equalTo(2)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(imageSliderView.snp.bottom)
            $0.width.equalTo(imageSliderView.snp.width)
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
        
        contentView.snp.makeConstraints {
            $0.top.equalTo(scrollView.snp.top)
            $0.leading.equalTo(scrollView.snp.leading)
            $0.trailing.equalTo(scrollView.snp.trailing)
            $0.width.equalTo(scrollView.snp.width)
            $0.bottom.equalTo(scrollView.snp.bottom)
        }
        
        topView.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).inset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(120)
        }
        
        topViewTitle.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(8)
        }
        
        topViewSubTitle.snp.makeConstraints {
            $0.top.equalTo(topViewTitle.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview().inset(20)
        }
        
        buttonsStackView.snp.makeConstraints {
            $0.top.equalTo(topView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.height.equalTo(100)
        }
        
        tagCollectionView.snp.makeConstraints {
            $0.top.equalTo(buttonsStackView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.height.equalTo(120)
        }
        
        moreInfoView.snp.makeConstraints {
            $0.top.equalTo(tagCollectionView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.height.equalTo(80)
        }
        
        moreInfoViewTopLabel.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(8)
            $0.height.equalTo(28)
        }
        
        moreInfoViewBottomLabel.snp.makeConstraints {
            $0.top.equalTo(moreInfoViewTopLabel.snp.bottom).offset(8)
            $0.leading.trailing.bottom.equalToSuperview().inset(8)
        }
        
        bottomStackView.snp.makeConstraints {
            $0.top.equalTo(moreInfoView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.height.equalTo(30)
        }
        
        shareButton.snp.makeConstraints {
            $0.width.equalTo(64)
        }
        
        siteButton.snp.makeConstraints {
            $0.width.equalTo(shareButton.snp.width)
        }
        
        gradeCollectionView.snp.makeConstraints {
            $0.top.equalTo(bottomStackView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(40)
            $0.bottom.equalToSuperview()
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
