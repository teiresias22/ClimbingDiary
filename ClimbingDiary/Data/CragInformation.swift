//
//  CragInformation.swift
//  ClimbingDiary
//
//  Created by Joonhwan Jeon on 2022/06/01.
//

import Foundation

struct CragInformation {
    
    let cragList: [crag] = [
        crag(name: "락트리 분당",
             image: [.customGray1!, .customGray2!, .customGray3!, .customGray4!, .customGray5!, .customGray6!, .customGray7!],
             introduceText: "경기남부 최대 규모 실내클라이밍 '락트리 분당'입니다.",
             callNumber: 01096080810,
             grade: [.red, .orange, .yellow, .green, .systemBlue, .blue, .purple, .systemPink, .brown, .white, .gray, .black],
             sector: ["sector1", "sector2", "sector3", "sector4", "sector5", "inboard"],
             changeOfSector: 14,
             cityCode: 21,
             location: "경기 성남시",
             latitude: 37.378773,
             longitude: 127.113268,
             price: "일일이용권 - 20,000원\n일일체험 - 30,000원\n암벽화 대여 3,000원\n초크 대여 2,000원\n10회권(6개월) - 170,000원\n1개월 이용권 - 120,000원\n3개월 이용권 - 300,000원\n6개월 이용권 - 520,000원\n1개월 강습+이용권 180,000원",
             parking: "3시간 무료, 4시간 2,000원, 5시간 3,000원, 6시간 4,000원",
             reservation: "연결 사이트",
             openingHours: ["11 ~ 21", "11 ~ 23", "11 ~ 23", "11 ~ 23", "11 ~ 23", "11 ~ 23", "11 ~ 21"],
             idCode: 00001),
    
        crag(name: "더클라임 양재",
             image: [.customBlue!, .customDeepBlue!, .customWhiteBlue!, .customWhite!, .customBlack!],
             introduceText: "서울 경기내 최대급 클라이밍 시설!\n하나의 회원권으로 전 지점을 동시에 이용 가능\n초보자부터 상급자까지 모두가 즐길 수 있는 다양한 문제\n각 분야의 다양한 경험을 가진 최고의 강사진\n500문제 이상의 볼더와 지구력 문제\n 매주 70문제 이상의 주기적인 세팅\n편리한 접근성과 개방적인 공간 구성\n요가와 스트레칭을 위한 별도 공간\n다양한 편의 시설과 휴게 공간\n클라이밍 용품을 위한 소매샵",
             callNumber: 025768821,
             grade: [.red, .orange, .yellow, .green, .systemBlue, .blue, .purple, .black],
             sector: ["sector1", "sector2", "sector3", "sector4", "sector5", "sector6", "sector7", "Endurance"],
             changeOfSector: 7,
             cityCode: 11,
             location: "강남구",
             latitude: 37.484959,
             longitude: 127.03567,
             price: "일일이용권 - 20,000원\n일일체험 - 30,000원\n암벽화 대여 3,000원\n10회권(6개월) - 170,000원\n1개월 이용권 - 130,000원\n3개월 이용권 - 300,000원\n6개월 이용권 - 520,000원\n1개월 강습+이용권 180,000원",
             parking: "3시간 무료",
             reservation: "연결 사이트",
             openingHours: ["10 ~ 20", "10 ~ 23", "10 ~ 23", "10 ~ 23", "10 ~ 23", "10 ~ 23", "10 ~ 20"],
             idCode: 00002)
    ]
    
}
