//
//  ScheduleViewController.swift
//  ClimbingDiary
//
//  Created by Joonhwan Jeon on 2022/05/30.
//

import UIKit

class ScheduleViewController: BaseViewController {
    let mainView = ScheduleView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "일정"
    }
}
