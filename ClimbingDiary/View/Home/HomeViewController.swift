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
        setUpViews(mainView.mainSectionView.label, mainView.mainSectionView.image, HomeViews.mainSection)
        setUpViews(mainView.firstSubView.label, mainView.firstSubView.image, HomeViews.firstView)
        setUpViews(mainView.secondSubView.label, mainView.secondSubView.image, HomeViews.secondView)
        setUpViews(mainView.therdSubView.label, mainView.therdSubView.image, HomeViews.therdView)
        setUpViews(mainView.forthSubView.label, mainView.forthSubView.image, HomeViews.forthView)
    }
    
    func setUpViews(_ targetLabel: UILabel, _ targetView: UIImageView, _ target: HomeViews) {
        targetLabel.text = target.text
        targetView.backgroundColor = target.color
        addTargetViewTapped(targetView, targetLabel, target)
    }
    
    func addTargetViewTapped(_ targetView: UIImageView, _ targetLabel: UILabel, _ target : HomeViews) {
        let viewTap = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        targetView.isUserInteractionEnabled = true
        targetView.addGestureRecognizer(viewTap)
        
        //뷰 모델에 담는게 돌아갈때마다 담기 때문에 제일 마지막 변수가 들어감. action에 넣어줘야 할 것 같은데 좀 더 알아봐야 할듯
        //tag를 사용하는것도 고려중
        viewModel.titleName.value = target.text
        viewModel.titleImage = target.color
    }
    
    @objc func viewTapped() {
        let vc = HomeListViewController()
        vc.viewModel = viewModel
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
