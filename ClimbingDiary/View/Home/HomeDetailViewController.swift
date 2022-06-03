//
//  HomeDetailViewController.swift
//  ClimbingDiary
//
//  Created by Joonhwan Jeon on 2022/06/02.
//

import UIKit

class HomeDetailViewController: BaseViewController {
    let mainView = HomeDetailView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCollectionView()
    }
    
    func setCollectionView() {
        mainView.topCollectionView.delegate = self
        mainView.topCollectionView.dataSource = self
        mainView.topCollectionView.register(HomeDetailImageCell.self, forCellWithReuseIdentifier: HomeDetailImageCell.identifier)
        
        mainView.tagCollectionView.delegate = self
        mainView.tagCollectionView.dataSource = self
        mainView.tagCollectionView.register(HomeDetailTagCell.self, forCellWithReuseIdentifier: HomeDetailTagCell.identifier)
    }
}

extension HomeDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == mainView.topCollectionView {
            return 1
        } else {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == mainView.topCollectionView {
            guard let item = mainView.topCollectionView.dequeueReusableCell(withReuseIdentifier: HomeDetailImageCell.identifier, for: indexPath) as? HomeDetailImageCell else { return UICollectionViewCell() }
            
            return item
        } else {
            guard let item = mainView.tagCollectionView.dequeueReusableCell(withReuseIdentifier: HomeDetailTagCell.identifier, for: indexPath) as? HomeDetailTagCell else { return UICollectionViewCell() }
            
            return item
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == mainView.topCollectionView {
            
        } else {
            
        }
    }
}
