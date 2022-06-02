//
//  HomeListViewController.swift
//  ClimbingDiary
//
//  Created by Joonhwan Jeon on 2022/06/01.
//

import UIKit

class HomeListViewController: BaseViewController {
    let mainView = HomeListView()
    var viewModel = HomeViewModel()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.titleName.value
        mainView.image.backgroundColor = viewModel.titleImage
        
        setView()
    }
    
    func setView() {
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.register(HomeListCell.self, forCellReuseIdentifier: HomeListCell.identifier)
        mainView.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
}

extension HomeListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CragInformation.init().mapAnnotations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeListCell.identifier, for: indexPath) as? HomeListCell else { return UITableViewCell() }
        let target = CragInformation.init().mapAnnotations[indexPath.row]
        
        cell.titleLabel.text = target.name
        cell.subTitleLabel.text = target.introduce
        cell.rightTopLabel.text = target.name
        cell.rightBottomLabel.text = target.name
        cell.backgroundColor = .gray
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
