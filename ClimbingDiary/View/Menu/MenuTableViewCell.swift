//
//  MenuTableViewCell.swift
//  ClimbingDiary
//
//  Created by Joonhwan Jeon on 2022/06/29.
//

import UIKit
import SnapKit
import Then

final class MenuTableViewCell: UITableViewCell{
    static let identifier = "MenuTableViewCell"
    
    let titleLabel = UILabel().then {
        $0.backgroundColor = .customGray4
    }
    
    let subLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 24)
        $0.backgroundColor = .customGray7
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
        addSubview(subLabel)
    }
    
    func setConstraints() {
        titleLabel.snp.makeConstraints {
            $0.height.equalTo(32)
            $0.width.equalTo(200)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().inset(8)
        }
        
        subLabel.snp.makeConstraints {
            $0.height.equalTo(24)
            $0.width.equalTo(80)
            $0.centerX.equalToSuperview()
            $0.trailing.equalToSuperview().inset(8)
        }
    }
}
