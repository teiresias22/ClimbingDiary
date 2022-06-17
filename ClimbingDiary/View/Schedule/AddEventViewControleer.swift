//
//  AddEventViewControleer.swift
//  ClimbingDiary
//
//  Created by Joonhwan Jeon on 2022/06/17.
//

import Foundation

class AddEventViewControleer: BaseViewController {
    let mainView = SearchView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "추가"
    }
}
