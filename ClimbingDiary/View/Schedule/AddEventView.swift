//
//  AddEventView.swift
//  ClimbingDiary
//
//  Created by Joonhwan Jeon on 2022/06/17.
//

import UIKit
import SnapKit
import Then

class AddEventView: UIView, ViewRepresentable {
    let inputTitleView = InputView()
    let inputDateView = InputView()
    
    let gradeLabel = UILabel().then {
        $0.text = "난이도"
        $0.textColor = .customBlack
    }
    
    let gradeInputCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.isPagingEnabled = true
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = .customGray1
        return view
    }()
    
    let sectorLabel = UILabel().then {
        $0.text = "섹터"
        $0.textColor = .customBlack
    }
    
    let sectorInputCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.collectionViewLayout = CollectionViewLeftAlignFlowLayout()
        view.layer.cornerRadius = 8
        view.layer.borderColor = UIColor.customBlack?.cgColor
        view.layer.borderWidth = 1
        view.backgroundColor = .customGray1
        
        if let flowLayout = view.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
        
        return view
    }()
    
    let memoView = UITextView().then {
        $0.backgroundColor = .customGray1
        $0.textColor = .customBlack
    }
    
    let gradeOutputCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.isPagingEnabled = true
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = .customGray1
        return view
    }()
    
    let sectorOutputCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.collectionViewLayout = CollectionViewLeftAlignFlowLayout()
        view.layer.cornerRadius = 8
        view.layer.borderColor = UIColor.customBlack?.cgColor
        view.layer.borderWidth = 1
        view.backgroundColor = .customGray1
        
        if let flowLayout = view.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
        
        return view
    }()
    
    let buttonStackView = UIStackView().then {
        $0.spacing = 8
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.backgroundColor = .customWhite
    }
    
    let saveButton = UIButton().then {
        $0.backgroundColor = .customBlue
        $0.tintColor = .customBlack
    }
    
    let cancelButton = UIButton().then {
        $0.backgroundColor = .error
        $0.tintColor = .customBlack
    }
    
    let pickerViewTextfield = UITextField()
        
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupView() {
        addSubview(inputTitleView)
        addSubview(inputDateView)
        addSubview(gradeLabel)
        addSubview(gradeInputCollectionView)
        addSubview(sectorLabel)
        addSubview(sectorInputCollectionView)
        addSubview(memoView)
        addSubview(gradeOutputCollectionView)
        addSubview(sectorOutputCollectionView)
        addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(saveButton)
        buttonStackView.addArrangedSubview(cancelButton)
        
        addSubview(pickerViewTextfield)
    }
    
    func setupConstraints() {
        inputTitleView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top).inset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(32)
        }
        
        inputDateView.snp.makeConstraints {
            $0.top.equalTo(inputTitleView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(32)
        }
        
        gradeLabel.snp.makeConstraints {
            $0.top.equalTo(inputDateView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(24)
        }
        
        gradeInputCollectionView.snp.makeConstraints {
            $0.top.equalTo(gradeLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(30)
        }
        
        sectorLabel.snp.makeConstraints {
            $0.top.equalTo(gradeInputCollectionView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(24)
        }
        
        sectorInputCollectionView.snp.makeConstraints {
            $0.top.equalTo(sectorLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(30)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).inset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(30)
        }
        
        gradeOutputCollectionView.snp.makeConstraints {
            $0.bottom.equalTo(sectorOutputCollectionView.snp.top).offset(-10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(30)
        }

        sectorOutputCollectionView.snp.makeConstraints {
            $0.bottom.equalTo(buttonStackView.snp.top).offset(-10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(30)
        }
        
        memoView.snp.makeConstraints {
            $0.top.equalTo(sectorInputCollectionView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(gradeOutputCollectionView.snp.top).offset(-20)
        }
        
        pickerViewTextfield.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.width.height.equalTo(0)
        }
    }
}
