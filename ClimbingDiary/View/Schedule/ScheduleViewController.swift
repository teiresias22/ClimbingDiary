//
//  ScheduleViewController.swift
//  ClimbingDiary
//
//  Created by Joonhwan Jeon on 2022/05/30.
//

import Foundation
import FSCalendar

class ScheduleViewController: BaseViewController {
    let mainView = ScheduleView()
    
    let dateFormatter = DateFormatter()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "일정"
        
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        
        setupCalendar()
        setButtonAction()
    }
    
    private func setupCalendar() {
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        mainView.calendar.delegate = self
        mainView.calendar.dataSource = self
    }
    
    private func setButtonAction() {
        mainView.todayButton.isHidden = true
        mainView.todayButton.addTarget(self, action: #selector(goToday), for: .touchUpInside)
        mainView.addEventButton.addTarget(self, action: #selector(addEvent), for: .touchUpInside)
    }
    
    @objc func goToday(){
        var today = dateFormatter.string(from: Date())
        mainView.calendar.select(dateFormatter.date(from: today), scrollToDate: true)
    }
    
    @objc func addEvent() {
        //일정 추가 페이지로 이동
    }
}

//MARK: - FSCalendarDelegate
extension ScheduleViewController: FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print(dateFormatter.string(from: date) + "선택됨")
    }
    
    func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
        switch dateFormatter.string(from: date) {
        case dateFormatter.string(from: Date()): return "오늘"
        case "2022-06-20" : return "출근"
        case "2022-06-21" : return "지각"
        case "2022-06-22" : return "결근"
        default : return nil
        }
    }
    
    func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
        mainView.todayButton.isHidden = false
    }
}

//MARK: - FSCalendarDataSource
extension ScheduleViewController: FSCalendarDataSource {
}

//MARK: - UITableViewDelegate
extension ScheduleViewController: UITableViewDelegate {
    
}

//MARK: - UITableViewDataSource
extension ScheduleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeListCell.identifier, for: indexPath) as? HomeListCell else { return UITableViewCell() }
        let target = CragInformation.init().cragList[indexPath.row]
        
        cell.titleLabel.text = target.name
        cell.subTitleLabel.text = target.introduce
        cell.rightTopLabel.text = target.name
        cell.rightBottomLabel.text = target.name
        
        cell.selectionStyle = .none
        return cell
    }
}
