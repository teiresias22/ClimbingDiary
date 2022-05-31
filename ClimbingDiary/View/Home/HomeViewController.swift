//
//  HomeViewController.swift
//  ClimbingDiary
//
//  Created by Joonhwan Jeon on 2022/05/30.
//

import UIKit
import SwiftUI

class HomeViewController: BaseViewController {
    let mainView = HomeView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "메인"
        
        setViews()
    }
    
    func setViews(){
        setMainSectionView()
        setFirstSubView()
        setSecondSubView()
        setTherdSubView()
        setForthSubView()
    }
    
    func setMainSectionView() {
        mainView.mainSectionView.label.text = "이벤트 암장"
        mainView.mainSectionView.image.backgroundColor = .systemCyan
    }
    
    func setFirstSubView() {
        mainView.firstSubView.label.text = "인기 암장"
        mainView.firstSubView.image.backgroundColor = .systemRed
    }
    
    func setSecondSubView() {
        mainView.secondSubView.label.text = "신규 암장"
        mainView.secondSubView.image.backgroundColor = .systemBlue
    }
    
    func setTherdSubView() {
        mainView.therdSubView.label.text = "추천 암장"
        mainView.therdSubView.image.backgroundColor = .systemMint
    }
    
    func setForthSubView() {
        mainView.forthSubView.label.text = "신규 세팅 암장"
        mainView.therdSubView.image.backgroundColor = .systemPink
    }
}
