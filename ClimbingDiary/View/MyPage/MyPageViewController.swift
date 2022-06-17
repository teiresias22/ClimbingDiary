//
//  MyPageViewController.swift
//  ClimbingDiary
//
//  Created by Joonhwan Jeon on 2022/05/30.
//

import Foundation

class MyPageViewController: BaseViewController {
    let mainView = MyPageView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "내정보"
    }
}
