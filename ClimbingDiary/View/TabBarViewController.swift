//
//  TabBarViewController.swift
//  ClimbingDiary
//
//  Created by Joonhwan Jeon on 2022/05/30.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .gray
        tabBar.backgroundColor = .white
        
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        homeVC.tabBarItem.image = UIImage(systemName: "house")
        homeVC.tabBarItem.title = "홈"
        
        let scheduleVC = UINavigationController(rootViewController: ScheduleViewController())
        scheduleVC.tabBarItem.image = UIImage(systemName: "calendar")
        scheduleVC.tabBarItem.title = "달력"
        
        let searchVC = UINavigationController(rootViewController: SearchViewController())
        searchVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        searchVC.tabBarItem.title = "검색"
        
        let myVC = UINavigationController(rootViewController: MyPageViewController())
        myVC.tabBarItem.image = UIImage(systemName: "person")
        myVC.tabBarItem.title = "내정보"
        
        viewControllers = [homeVC, scheduleVC, searchVC, myVC]
        
    }
}
