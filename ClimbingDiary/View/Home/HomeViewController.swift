//
//  HomeViewController.swift
//  ClimbingDiary
//
//  Created by Joonhwan Jeon on 2022/05/30.
//

import UIKit

class HomeViewController: BaseViewController {
    let mainView = HomeView()
    var viewModel = HomeViewModel()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "메인"
        
        setView()
    }
    
    private func setView(){
        setUpViews(mainView.mainSectionView.label, mainView.mainSectionView.image, HomeViews.mainSection)
        setUpViews(mainView.firstSubView.label, mainView.firstSubView.image, HomeViews.firstView)
        setUpViews(mainView.secondSubView.label, mainView.secondSubView.image, HomeViews.secondView)
        setUpViews(mainView.therdSubView.label, mainView.therdSubView.image, HomeViews.therdView)
        setUpViews(mainView.forthSubView.label, mainView.forthSubView.image, HomeViews.forthView)
    }
    
    private func setUpViews(_ targetLabel: UILabel, _ targetView: UIImageView, _ target: HomeViews) {
        targetLabel.text = target.text
        targetView.backgroundColor = target.color
        addTargetViewTapped(targetView, targetLabel, target)
    }
    
    private func addTargetViewTapped(_ targetView: UIImageView, _ targetLabel: UILabel, _ target : HomeViews) {
        let viewTap = CustomTapGestureRecognizer(target: self, action: #selector(viewTapped(sender:)))
        viewTap.customNameValue = targetLabel.text
        viewTap.customColorValue = targetView.backgroundColor
        targetView.isUserInteractionEnabled = true
        targetView.addGestureRecognizer(viewTap)
    }
    
    @objc func viewTapped(sender: CustomTapGestureRecognizer) {
        viewModel.homeListTitle.value = sender.customNameValue ?? "알수 없는 분류"
        viewModel.homeListImage = sender.customColorValue ?? .gray
        
        let vc = HomeListViewController()
        vc.viewModel = viewModel
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

final class CustomTapGestureRecognizer: UITapGestureRecognizer {
    var customNameValue: String?
    var customColorValue: UIColor?
}
