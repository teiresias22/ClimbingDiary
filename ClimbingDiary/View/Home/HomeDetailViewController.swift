//
//  HomeDetailViewController.swift
//  ClimbingDiary
//
//  Created by Joonhwan Jeon on 2022/06/02.
//

import UIKit

class HomeDetailViewController: BaseViewController {
    let mainView = HomeDetailView()
    var viewModel = HomeViewModel()
    
    var timer : Timer?
    var cuttentCellIndex = 0
    var progress: Progress?
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViewLabels()
        setButtonStack()
        
        progressSet()
        activateTimer()
        
        setImageSliderView()
        setTagCollectionView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let segmentSize = viewModel.homeDetailNo.image.count
        mainView.imageSliderView.scrollToItem(at: IndexPath(item: segmentSize,
                                                            section: 0),
                                              at: .centeredHorizontally,
                                              animated: false)
    }
    
    func setViewLabels() {
        mainView.topViewTitle.text = viewModel.homeDetailNo.name
        mainView.topViewSubTitle.text = viewModel.homeDetailNo.introduce
        mainView.moreInfoViewTopLabel.text = viewModel.homeDetailNo.parking
        mainView.moreInfoViewBottomLabel.text = viewModel.homeDetailNo.price
    }
    
    func progressSet() {
        mainView.progressView.progress = 0.0
        progress = Progress(totalUnitCount: Int64(viewModel.homeDetailNo.image.count))
        progress?.completedUnitCount = 1
        mainView.progressView.setProgress(Float(progress!.fractionCompleted), animated: false)
    }
    
    private func invalidateTimer() {
        timer?.invalidate()
    }
    
    private func activateTimer() {
        timer = Timer.scheduledTimer(timeInterval: 2,
                                     target: self,
                                     selector: #selector(timerCallBack),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @objc func timerCallBack() {
        var item = visibleCellIndexPath().item
        var image = viewModel.homeDetailNo.image
        
        if item == image.count * 3 - 1 {
            mainView.imageSliderView.scrollToItem(at: IndexPath(item: image.count * 2 - 1, section: 0),
                                                  at: .centeredHorizontally,
                                                  animated: false)
            item = image.count * 2 - 1
        }
        
        item += 1
        mainView.imageSliderView.scrollToItem(at: IndexPath(item: item, section: 0),
                                              at: .centeredHorizontally,
                                              animated: true)
        let unitCount: Int = item % image.count + 1
        progress?.completedUnitCount = Int64(unitCount)
        mainView.progressView.setProgress(Float(progress!.fractionCompleted),
                                          animated: false)
    }
    
    func setImageSliderView() {
        mainView.imageSliderView.delegate = self
        mainView.imageSliderView.dataSource = self
        mainView.imageSliderView.register(HomeDetailImageCell.self, forCellWithReuseIdentifier: HomeDetailImageCell.identifier)
    }
    
    func setTagCollectionView() {
        mainView.tagCollectionView.delegate = self
        mainView.tagCollectionView.dataSource = self
        mainView.tagCollectionView.register(HomeDetailTagCell.self, forCellWithReuseIdentifier: HomeDetailTagCell.identifier)
    }
    
    func setButtonStack() {
        mainView.sectorButton.text.text = viewModel.homeDetailNo.numOfSector
        mainView.openHourButton.label.text = nowDate()
        mainView.openHourButton.text.text = viewModel.homeDetailNo.openingHours[setOpeningHours()]
    }
    
    func nowDate() -> String {
        let nowDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko")
        dateFormatter.dateFormat = "E요일"
        let todayDate = dateFormatter.string(from: nowDate)
        
        return todayDate
    }
    
    func setOpeningHours() -> Int {
        let nowDate = nowDate()
        var index = 6
        
        if nowDate == "일요일" {
            index = 0
        } else if nowDate == "월요일 " {
            index = 1
        } else if nowDate == "화요일" {
            index = 2
        } else if nowDate == "수요일" {
            index = 3
        } else if nowDate == "목요일" {
            index = 4
        } else if nowDate == "금요일" {
            index = 5
        }
        return index
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 2,
                                     target: self,
                                     selector: #selector(moveToNextIndex),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @objc func moveToNextIndex() {
        cuttentCellIndex += 1
        mainView.imageSliderView.scrollToItem(at: IndexPath(item: cuttentCellIndex, section: 0),
                                              at: .centeredHorizontally,
                                              animated: true)
    }
}

extension HomeDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == mainView.imageSliderView {
            return viewModel.homeDetailNo.image.count * 3
        } else {
            return viewModel.homeDetailNo.tag.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == mainView.imageSliderView {
            let images = viewModel.homeDetailNo.image[indexPath.item % viewModel.homeDetailNo.image.count]
            if let item = collectionView.dequeueReusableCell(withReuseIdentifier: HomeDetailImageCell.identifier, for: indexPath) as? HomeDetailImageCell {
                
                item.image.backgroundColor = images
                return item
            }
            return UICollectionViewCell()
        } else {
            guard let item = mainView.tagCollectionView.dequeueReusableCell(withReuseIdentifier: HomeDetailTagCell.identifier, for: indexPath) as? HomeDetailTagCell else { return UICollectionViewCell() }
            item.label.text = viewModel.homeDetailNo.tag[indexPath.row]
            
            return item
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) -> CGSize {
        if collectionView == mainView.imageSliderView {
            return CGSize(width: mainView.imageSliderView.frame.width, height: mainView.imageSliderView.frame.height)
        } else {
            return CGSize(width: 0, height: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == mainView.imageSliderView {
            print(#function)
        } else {
            print(#function)
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        invalidateTimer()
        activateTimer()
        var images = viewModel.homeDetailNo.image
        var item = visibleCellIndexPath().item
        
        if item == images.count * 3 - 2 {
            item = images.count * 2
        } else if item == 1 {
            item = images.count + 1
        }
        
        mainView.imageSliderView.scrollToItem(at: IndexPath(item: item, section: 0),
                                              at: .centeredHorizontally,
                                              animated: false)
        
        let unitCount: Int = item % images.count + 1
        progress?.completedUnitCount = Int64(unitCount)
        mainView.progressView.setProgress(Float(progress!.fractionCompleted), animated: false)
    }
    
    private func visibleCellIndexPath() -> IndexPath {
        return mainView.imageSliderView.indexPathsForVisibleItems[0]
    }
}

extension HomeDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == mainView.imageSliderView {
            return CGSize(width: mainView.frame.width, height: 200)
        } else {
            return CGSize(width: mainView.frame.width, height: 20)
        }
    }
}
