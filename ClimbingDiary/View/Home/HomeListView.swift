//
//  HomeListView.swift
//  ClimbingDiary
//
//  Created by Joonhwan Jeon on 2022/06/01.
//

import UIKit
import SnapKit
import Then

class HomeListView: UIView, ViewRepresentable {
    let image = UIImageView().then {
        $0.backgroundColor = .systemGray
    }
    
    let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupView() {
        addSubview(image)
        addSubview(tableView)
    }
    
    func setupConstraints() {
        image.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top).inset(8)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(200)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(image.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(8)
            $0.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).inset(8)
        }
    }
}
