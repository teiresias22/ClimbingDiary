//
//  HomeListCell.swift
//  ClimbingDiary
//
//  Created by Joonhwan Jeon on 2022/06/01.
//

import UIKit
import SnapKit
import Then

class HomeListCell: UITableViewCell {
    static let identifier = "HomeListCell"
    
    let titleLabel = UILabel().then {
        $0.text = "Title_@@@@"
    }
    
    let subTitleLabel = UILabel().then {
        $0.text = "SubTitle_@@@@"
    }
    
    let rightTopLabel = UILabel().then {
        $0.text = "Distance_@@@@"
    }
    
    let rightBottomLabel = UILabel().then {
        $0.text = "Location_@@@@"
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
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        addSubview(rightTopLabel)
        addSubview(rightBottomLabel)
    }
    
    func setConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(8)
            $0.trailing.equalTo(rightTopLabel.snp.leading).offset(8)
        }
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().inset(8)
            $0.size.width.equalTo(titleLabel)
        }
        rightTopLabel.snp.makeConstraints {
            $0.top.trailing.equalToSuperview().inset(8)
            $0.size.width.equalTo(100)
        }
        rightBottomLabel.snp.makeConstraints {
            $0.top.equalTo(rightTopLabel.snp.bottom).offset(8)
            $0.trailing.equalToSuperview().inset(8)
            $0.size.width.equalTo(rightTopLabel)
        }
    }
}
