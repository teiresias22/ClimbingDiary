//
//  HomeMapViewController.swift
//  ClimbingDiary
//
//  Created by Joonhwan Jeon on 2022/06/12.
//

import Foundation
import CoreLocation

class HomeMapViewController: BaseViewController {
    let mainView = HomeMapView()
    var viewModel = HomeViewModel()
    
    var locationManager: CLLocationManager!
    var currentLocation: CLLocationCoordinate2D!
    
    var locationTrakingActive = false
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "지도"
        
        //Mapview 설정
        mainView.mapView.delegate = self
        checkMapType()
        
        //맵핀 추가
        addMapPoint()
        goToPin()
        
        //mapTypeButtonAction
        mainView.mapTypeButton.addTarget(self,
                                         action: #selector(mapTypeButtonClicked),
                                         for: .touchUpInside)
        mainView.mapTrackingModeButton.addTarget(self,
                                                 action: #selector(mapTrackingModeButtonClicked),
                                                 for: .touchUpInside)
        mainView.mapLocationTrakingModeButton.addTarget(self,
                                                        action: #selector(mapLocationTrakingModeButtonClicked),
                                                        for: .touchUpInside)
    }
    
    //위치 추적 권한 요청
    private func requestAuthorization() {
        if locationManager == nil {
            locationManager = CLLocationManager()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            locationManager.delegate = self
            locationManagerDidChangeAuthorization(locationManager)
        } else {
            locationManager.startMonitoringSignificantLocationChanges()
        }
    }
    
    //맵핀 추가
    func addMapPoint() {
        let poItem = MTMapPOIItem()
        
        poItem.itemName = viewModel.homeDetailNo.name
        poItem.mapPoint = MTMapPoint(geoCoord: MTMapPointGeo(latitude: viewModel.homeDetailNo.latitude,
                                                             longitude: viewModel.homeDetailNo.longitude))
        poItem.markerType = .redPin
        
        mainView.mapView.add(poItem)
    }
    
    //MARK: - MapTypeMode
    private func checkMapType() {
        let baseMapType = UserDefaults.standard.integer(forKey: SetUserDefault.mapType.rawValue)
        
        switch baseMapType {
        case 1: satelliteMapType()
        case 2: hybridMapType()
        default: standardMapType()
        }
    }
    
    @objc func mapTypeButtonClicked() {
        let baseMapType = UserDefaults.standard.integer(forKey: SetUserDefault.mapType.rawValue)
        
        switch baseMapType {
        case 0: UserDefaults.standard.set(1, forKey: SetUserDefault.mapType.rawValue)
            satelliteMapType()
        case 1: UserDefaults.standard.set(2, forKey: SetUserDefault.mapType.rawValue)
            hybridMapType()
        default: UserDefaults.standard.set(0, forKey: SetUserDefault.mapType.rawValue)
            standardMapType()
        }
    }
    
    private func standardMapType() {
        mainView.mapView.baseMapType = .standard
        mainView.mapTypeButton.backgroundColor = .white
        mainView.mapTypeButton.tintColor = .black
    }
    
    private func satelliteMapType() {
        mainView.mapView.baseMapType = .satellite
        mainView.mapTypeButton.backgroundColor = .systemCyan
        mainView.mapTypeButton.tintColor = .white
    }
    
    private func hybridMapType() {
        mainView.mapView.baseMapType = .hybrid
        mainView.mapTypeButton.backgroundColor = .systemBlue
        mainView.mapTypeButton.tintColor = .white
    }
    
    //MARK: - MapTrakingMode
    private func checkMapTrakingMode() {
        let currentLocationTrackingMode = UserDefaults.standard.bool(forKey: SetUserDefault.mapTrackingModeButton.rawValue)
        if currentLocationTrackingMode {
            mapTrakingActive()
        } else {
            mapTrakingDeactive()
        }
    }
    
    @objc func mapTrackingModeButtonClicked() {
        let currentLocationTrackingMode = UserDefaults.standard.bool(forKey: SetUserDefault.mapTrackingModeButton.rawValue)
        checkMapTrakingMode()
        
        if currentLocationTrackingMode {
            UserDefaults.standard.set(false, forKey: SetUserDefault.mapTrackingModeButton.rawValue)
            mapTrakingDeactive()
        } else {
            UserDefaults.standard.set(true, forKey: SetUserDefault.mapTrackingModeButton.rawValue)
            mapTrakingActive()
        }
    }
    
    private func mapTrakingActive(){
        mainView.mapView.currentLocationTrackingMode = .onWithHeading
        mainView.mapTrackingModeButton.backgroundColor = .systemBlue
        mainView.mapTrackingModeButton.tintColor = .white
    }
    
    private func mapTrakingDeactive() {
        mainView.mapView.currentLocationTrackingMode = .onWithoutHeading
        mainView.mapTrackingModeButton.backgroundColor = .white
        mainView.mapTrackingModeButton.tintColor = .black
    }
    
    //MARK: - MapLocationTrackingMode
    @objc func mapLocationTrakingModeButtonClicked() {
        if locationTrakingActive {
            goToPin()
        } else {
            goToLocation()
        }
        locationTrakingActive = !locationTrakingActive
    }
    
    private func goToPin() {
        mainView.mapView.showCurrentLocationMarker = false
        mainView.mapView.currentLocationTrackingMode = .off
        mainView.mapView.setMapCenter(.init(geoCoord: .init(latitude: viewModel.homeDetailNo.latitude,
                                                            longitude: viewModel.homeDetailNo.longitude)),
                                      animated: true)
        mainView.mapLocationTrakingModeButton.tintColor = .black
        mainView.mapLocationTrakingModeButton.backgroundColor = .white
    }
    
    private func goToLocation() {
        mainView.mapView.showCurrentLocationMarker = true
        mainView.mapLocationTrakingModeButton.tintColor = .white
        mainView.mapLocationTrakingModeButton.backgroundColor = .systemBlue
        checkMapTrakingMode()
    }
}

//MARK: - MapViewDelegate
extension HomeMapViewController: MTMapViewDelegate {
    func mapView(_ mapView: MTMapView!, updateCurrentLocation location: MTMapPoint!, withAccuracy accuracy: MTMapLocationAccuracy) {
        let currentLocation = location?.mapPointGeo()
        if let latitude = currentLocation?.latitude, let longitude = currentLocation?.longitude {
            LocationService.init().latitude = latitude
            LocationService.init().longitude = longitude
        }
    }
    
    //권한이 변경되면 알려줌
    func mapView(_ mapView: MTMapView!, updateDeviceHeading headingAngle: MTMapRotationAngle) {
        print(#function)
    }
    
    func mapView(_ mapView: MTMapView!, failedUpdatingCurrentLocationWithError error: Error!) {
        /*
         * [User Location Tracking] 현위치를 얻고자 할때 실패한 경우 통보받을 수 있다.
         * MTMapView 클래스의 currentLocationTrackingMode property를 통해서
         * 사용자 현위치 트래킹 기능이 켜고자 했을 경우(MTMapCurrentLocationTrackingOnWithoutHeading, MTMapCurrentLocationTrackingOnWithHeading)
         * 위치 사용 권한이나 기타 다른 이유로 인해 오류가 발생했을 때 발생한다.
         * @param mapView MTMapView 객체
         * @param error 오류가 발생한 정보를 담고 있는 객체
         */
    }
    
    func mapView(_ mapView: MTMapView!, touchedCalloutBalloonOf poiItem: MTMapPOIItem!) {
        //마커 호출하면 뭘 해야하나??
        /*
         * [POI Item] 단말 사용자가 POI Item 아이콘(마커) 위에 나타난 말풍선(Callout Balloon)을 터치한 경우 호출된다.
         * @param mapView MTMapView 객체
         * @param poiItem 말풍선이 터치된 POI Item 객체
         * @see MTMapPOIItem
         */
    }
    
}

//MARK: - CLLocationManagerDelegate
extension HomeMapViewController: CLLocationManagerDelegate {
    func getLocationUsegePromission(){
        self.locationManager.requestWhenInUseAuthorization()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .authorizedWhenInUse {
            currentLocation = locationManager.location?.coordinate
            LocationService.shared.longitude = currentLocation.longitude
            LocationService.shared.latitude = currentLocation.latitude
        }
    }
}

//MARK: - LocationService
class LocationService {
    static var shared = LocationService()
    var longitude: Double!
    var latitude: Double!
}
