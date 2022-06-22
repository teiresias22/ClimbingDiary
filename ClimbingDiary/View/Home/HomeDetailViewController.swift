//
//  HomeDetailViewController.swift
//  ClimbingDiary
//
//  Created by Joonhwan Jeon on 2022/06/02.
//

import Foundation

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
                
        //슬라이드 기본 설정
        progressSet()
        activateTimer()
        
        setImageSliderView()
        setMenuSliderView()
        setDisplayTableView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let segmentSize = viewModel.homeDetailNo.image.count
        mainView.imageSliderView.scrollToItem(at: IndexPath(item: segmentSize,
                                                            section: 0),
                                              at: .centeredHorizontally,
                                              animated: false)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    private func progressSet() {
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
    
    private func setImageSliderView() {
        mainView.imageSliderView.delegate = self
        mainView.imageSliderView.dataSource = self
        mainView.imageSliderView.register(HomeDetailImageCell.self,
                                          forCellWithReuseIdentifier: HomeDetailImageCell.identifier)
    }
    
    private func setMenuSliderView() {
        mainView.menuSliderView.delegate = self
        mainView.menuSliderView.dataSource = self
        mainView.menuSliderView.register(HomeDetailTagCell.self,
                                         forCellWithReuseIdentifier: HomeDetailTagCell.identifier)
    }
    
    private func setDisplayTableView() {
        mainView.displayTableView.delegate = self
        mainView.displayTableView.dataSource = self
        mainView.displayTableView.register(HomeDetailCell.self, forCellReuseIdentifier: HomeDetailCell.identifier)
        mainView.displayTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    //MARK: - SETDATE
    private func nowDate() -> String {
        let nowDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko")
        dateFormatter.dateFormat = "E요일"
        let todayDate = dateFormatter.string(from: nowDate)
        
        return todayDate
    }
    
    private func setOpeningHours() -> Int {
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
    
    //MARK: - TIMER
    private func startTimer() {
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
    
    //MARK: - visibleCellIndexPath
    private func visibleCellIndexPath() -> IndexPath {
        return mainView.imageSliderView.indexPathsForVisibleItems[0]
    }
    
    //MARK: - CallViewTapped
    @objc func callViewTapped() {
        self.checkEnterBackground()
        let number: Int = viewModel.homeDetailNo.callNumber
        if let url = NSURL(string: "tel://0" + "\(number)"),
                           UIApplication.shared.canOpenURL(url as URL) {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
    }
    
    private func checkEnterBackground() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didEnterBackground),
                                               name: UIApplication.didEnterBackgroundNotification,
                                               object: nil)
    }
    
    //통화 종료후 돌아올 화면 설정
    @objc func didEnterBackground() {
        let vc = TabBarViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}

//MARK: - UICollectionViewDelegate
extension HomeDetailViewController: UICollectionViewDelegate {
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
}

//MARK: - UICollectionViewDataSource
extension HomeDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == mainView.imageSliderView {
            return viewModel.homeDetailNo.image.count * 3
        } else {
            return DetailMenuInformation.init().detailMenu.count
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
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: HomeDetailTagCell.identifier, for: indexPath) as? HomeDetailTagCell else { return UICollectionViewCell() }
            
            let list = DetailMenuInformation.init().detailMenu[indexPath.row]
            item.layer.cornerRadius = 8
            item.layer.borderWidth = 1
            item.layer.borderColor = UIColor.customBlack?.cgColor
            item.label.text = list.Title
            item.backgroundColor = .customGray2
            
            return item
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) -> CGSize {
        if collectionView == mainView.imageSliderView {
            return CGSize(width: mainView.imageSliderView.frame.width, height: mainView.imageSliderView.frame.height)
        } else {
            return CGSize(width: 120, height: 60)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == mainView.imageSliderView {
            print(#function)
        } else {
            print(#function)
        }
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension HomeDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == mainView.imageSliderView {
            return CGSize(width: mainView.frame.width, height: 200)
        } else {
            return CGSize(width: 120, height: 60)
        }
    }
}

//MARK: -
extension HomeDetailViewController: UITableViewDelegate {
    
}

extension HomeDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeDetailCell.identifier, for: indexPath) as? HomeDetailCell else { return UITableViewCell() }
        
        cell.title.text = viewModel.homeDetailNo.name
        cell.subTitle.text = viewModel.homeDetailNo.introduceText
        cell.backgroundColor = .customGray1
        
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return mainView.displayTableView.frame.height
    }
}

final class gradeCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = String(describing: gradeCollectionViewCell.self)
}
