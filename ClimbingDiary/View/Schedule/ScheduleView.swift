//
//  ScheduleView.swift
//  ClimbingDiary
//
//  Created by Joonhwan Jeon on 2022/05/30.
//

import UIKit
import SnapKit
import Then
import FSCalendar

class ScheduleView: UIView, ViewRepresentable {
    let calendar = FSCalendar().then {
        $0.headerHeight = 50
        $0.appearance.headerDateFormat = "YYYY년 M월"
        $0.appearance.headerTitleColor = .black
        $0.appearance.headerTitleFont = UIFont.systemFont(ofSize: 24)
        $0.appearance.weekdayTextColor = .black
        $0.appearance.titleWeekendColor = .systemBlue
        $0.scrollEnabled = true
        $0.scrollDirection = .vertical
        $0.locale = Locale(identifier: "ko_KR")
    }
    
    let todayButton = UIButton().then {
        $0.setTitle("오늘", for: .normal)
        $0.tintColor = .black
        $0.backgroundColor = .systemGray
        $0.layer.cornerRadius = 8
    }
    
    let addEventButton = UIButton().then {
        $0.setTitle("추가", for: .normal)
        $0.tintColor = .black
        $0.backgroundColor = .systemGray
        $0.layer.cornerRadius = 8
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
        addSubview(calendar)
        calendar.addSubview(todayButton)
        calendar.addSubview(addEventButton)
        addSubview(tableView)
    }
    
    func setupConstraints() {
        calendar.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(300)
        }
        
        todayButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(20)
            $0.height.equalTo(30)
            $0.width.equalTo(60)
        }
        
        addEventButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(30)
            $0.width.equalTo(60)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(calendar.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
        }
    }
}
