//
//  DetailLeftCell.swift
//  ClimbingDiary
//
//  Created by Joonhwan Jeon on 2022/06/21.
//

import UIKit
import SnapKit
import Then

final class DetailLeftCell: UITableViewCell {
    static let identifier = "DetailLeftCell"
    
    let nameTitle = UILabel().then {
        $0.text = "@@@@@@@@"
        $0.textColor = .customBlack
    }
    
    let subTitle = UILabel().then {
        $0.text = "@@@@@@@@"
        $0.textColor = .customGray4
        $0.numberOfLines = 0
    }
    
    let openingHoursView: UICollectionView = {
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
    
    let buttonStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 16
        $0.alignment = .fill
        $0.distribution = .fillEqually
    }
    
    let callButton = UIButton().then {
        $0.backgroundColor = .customBlack
        $0.tintColor = .customWhite
        $0.layer.cornerRadius = 20
    }
    
    let mapVutton = UIButton().then {
        $0.backgroundColor = .customBlack
        $0.tintColor = .customWhite
        $0.layer.cornerRadius = 20
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setViews() {
        
    }
    
    func setConstraints() {
        
    }
}
