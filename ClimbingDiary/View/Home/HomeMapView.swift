//
//  HomeMapView.swift
//  ClimbingDiary
//
//  Created by Joonhwan Jeon on 2022/06/12.
//

import UIKit
import SnapKit
import Then

class HomeMapView: UIView, ViewRepresentable, MTMapViewDelegate {
    let mapView = MTMapView().then {
        $0.setMapCenter(.init(geoCoord: .init(latitude: 37.566021, longitude: 126.978690)), animated: true)
    }
    
    let buttonStackView = UIStackView().then {
        $0.spacing = 8
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fillEqually
    }
    
    let mapTypeButton = UIButton().then {
        $0.setImage(UIImage(systemName: "square.stack.3d.up"), for: .normal)
        $0.setTitle("", for: .normal)
        $0.layer.cornerRadius = 20
        $0.tintColor = .black
        $0.backgroundColor = .white
    }
    
    let mapTrackingModeButton = UIButton().then {
        $0.setImage(UIImage(systemName: "location.north"), for: .normal)
        $0.setTitle("", for: .normal)
        $0.layer.cornerRadius = 20
        $0.tintColor = .black
        $0.backgroundColor = .white
    }
    
    let mapLocationTrakingModeButton = UIButton().then {
        $0.setImage(UIImage(systemName: "mappin.and.ellipse"), for: .normal)
        $0.setTitle("", for: .normal)
        $0.layer.cornerRadius = 20
        $0.tintColor = .black
        $0.backgroundColor = .white
    }
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupView() {
        addSubview(mapView)
        mapView.addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(mapTypeButton)
        buttonStackView.addArrangedSubview((mapTrackingModeButton))
        buttonStackView.addArrangedSubview(mapLocationTrakingModeButton)
    }
    
    func setupConstraints() {
        mapView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
        }
        
        buttonStackView.snp.makeConstraints { make in
            make.top.equalTo(mapView.snp.top).inset(20)
            make.trailing.equalTo(mapView.snp.trailing).inset(20)
            make.width.equalTo(40)
            make.height.equalTo(136)
        }
    }
}

