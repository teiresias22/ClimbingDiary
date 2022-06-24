//
//  DetailRightCell.swift
//  ClimbingDiary
//
//  Created by Joonhwan Jeon on 2022/06/24.
//

import UIKit
import SnapKit
import Then

final class DetailRightCell: UITableViewCell {
    static let identifier = "DetailRightCell"
    
    let sectorImageView = UIImageView().then {
        $0.backgroundColor = .customGray4
    }
    
    let textStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 8
        $0.alignment = .fill
        $0.distribution = .fill
    }
    
    let defaultTextLabel = UILabel().then {
        $0.text = "다음번 교체되는 섹터는"
        $0.textColor = .customBlack
    }
    
    let changeSectorLabel = UILabel().then {
        $0.text = "@@@@@@@@"
        $0.textColor = .customBlack
    }
    
    let gradeView: UICollectionView = {
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
