//
//  CityInformation.swift
//  ClimbingDiary
//
//  Created by Joonhwan Jeon on 2022/06/19.
//

import Foundation

struct CityInformation {
    
    let city: [City] = [
        
        City(code: 11, city: "서울특별시"),
        City(code: 12, city: "부산광역시"),
        City(code: 13, city: "대구광역시"),
        City(code: 14, city: "인천광역시"),
        City(code: 15, city: "광주광역시"),
        City(code: 16, city: "대전광역시"),
        City(code: 17, city: "울산광역시"),
        City(code: 18, city: "세종특별시"),
        City(code: 21, city: "경기도"),
        City(code: 22, city: "강원도"),
        City(code: 23, city: "충청북도"),
        City(code: 24, city: "충청남도"),
        City(code: 25, city: "전라북도"),
        City(code: 26, city: "전라남도"),
        City(code: 27, city: "경상북도"),
        City(code: 28, city: "경상남도"),
        City(code: 31, city: "제주도"),
        City(code: 99, city: "기타"),
        City(code: 00, city: "모두")
    ]
}
