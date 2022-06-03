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
    
    func setView(){
        setUpViews(mainView.mainSectionView.label, mainView.mainSectionView.image, "이벤트 암장", .systemCyan)
        setUpViews(mainView.firstSubView.label, mainView.firstSubView.image, "인기 암장", .systemRed)
        setUpViews(mainView.secondSubView.label, mainView.secondSubView.image, "신규 암장", .systemBlue)
        setUpViews(mainView.therdSubView.label, mainView.therdSubView.image, "추천 암장", .systemMint)
        setUpViews(mainView.forthSubView.label, mainView.forthSubView.image, "신규 세팅 암장", .systemPink)
    }
    
    func setUpViews(_ targetLabel: UILabel, _ targetView: UIImageView, _ name: String, _ image: UIColor) {
        targetLabel.text = name
        targetView.backgroundColor = image
        addTargetViewTapped(targetView, targetLabel, image)
    }
    
    func addTargetViewTapped(_ targetView: UIImageView, _ targetLabel: UILabel, _ targetImage: UIColor ) {
        let viewTap = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        targetView.isUserInteractionEnabled = true
        targetView.addGestureRecognizer(viewTap)
        viewModel.titleName.value = targetLabel.text ?? ""
        viewModel.titleImage = targetImage 
    }
    
    @objc func viewTapped() {
        let vc = HomeListViewController()
        vc.viewModel = viewModel
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
