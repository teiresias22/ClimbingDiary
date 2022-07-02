//
//  MenuViewController.swift
//  ClimbingDiary
//
//  Created by Joonhwan Jeon on 2022/06/29.
//

import UIKit

class MenuViewController : UIViewController {
    let tableView = UITableView()
    let list = ["menu1", "menu2", "menu3", "menu4", "menu5", "menu6"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Menu"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(MenuTableViewCell.self, forCellReuseIdentifier: MenuTableViewCell.identifier)

        setConstraint()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    private func setConstraint(){
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
}

extension MenuViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.identifier, for: indexPath) as? MenuTableViewCell else { return UITableViewCell() }
        let menu = list[indexPath.row]
        
        switch menu {
        case "menu1" : cell.titleLabel.text = MenuList
        default:
            <#code#>
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        viewModel.homeDetailNo = CragInformation.init().cragList[indexPath.row]
//        let vc = HomeDetailViewController()
//        vc.viewModel = viewModel
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
