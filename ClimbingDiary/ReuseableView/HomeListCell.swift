//
//  HomeListCell.swift
//  ClimbingDiary
//
//  Created by Joonhwan Jeon on 2022/06/01.
//

import UIKit
import SnapKit
import Then

final class HomeListCell: UITableViewCell {
    static let identifier = "HomeListCell"
    
    let titleLabel = UILabel().then {
        $0.text = "Title_@@@@"
        $0.backgroundColor = .systemGray2
    }
    
    let subTitleLabel = UILabel().then {
        $0.text = "SubTitle_@@@@"
        $0.numberOfLines = 2
        $0.backgroundColor = .systemGray3
    }
    
    let rightTopLabel = UILabel().then {
        $0.text = "Distance_@@@@"
        $0.backgroundColor = .systemGray4
    }
    
    let rightBottomLabel = UILabel().then {
        $0.text = "Location_@@@@"
        $0.backgroundColor = .systemGray5
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
            $0.top.leading.equalToSuperview().inset(4)
            $0.trailing.equalTo(rightTopLabel.snp.leading).offset(-4)
            $0.height.equalTo(29)
        }
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().inset(4)
            $0.height.equalTo(58)
            $0.width.equalTo(titleLabel)
        }
        rightTopLabel.snp.makeConstraints {
            $0.top.trailing.equalToSuperview().inset(4)
            $0.width.equalTo(100)
            $0.height.equalTo(titleLabel.snp.height)
        }
        rightBottomLabel.snp.makeConstraints {
            $0.top.equalTo(rightTopLabel.snp.bottom).offset(35)
            $0.trailing.equalToSuperview().inset(4)
            $0.width.equalTo(rightTopLabel)
            $0.height.equalTo(titleLabel.snp.height)
        }
    }
}
