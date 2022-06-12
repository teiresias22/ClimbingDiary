//
//  HomeMapViewController.swift
//  ClimbingDiary
//
//  Created by Joonhwan Jeon on 2022/06/12.
//

import UIKit

class HomeMapViewController: BaseViewController {
    let mainView = HomeMapView()
    var viewModel = HomeViewModel()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "지도"
        
        mainView.mapView.delegate = self
        mainView.mapView.baseMapType = .standard
    }
}

extension HomeMapViewController: MTMapViewDelegate {
     
}
