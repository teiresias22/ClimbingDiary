//
//  CragInformation.swift
//  ClimbingDiary
//
//  Created by Joonhwan Jeon on 2022/06/01.
//

import Foundation
import CoreLocation

struct CragInformation {
    
    let cragList: [crag] = [
        crag(image: [.gray, .black, .blue], name: "락트리 분당", introduce: "경기남부 최대 규모 실내클라이밍 '락트리 분당' 입니다!", location: "경기 성남시 분당구 황새울로 224 B1층 2호", latitude: 37.378773, longitude: 127.113268, numOfSector: "5", changeOfSector: "2주", openingHours: ["11 ~ 21", "11 ~ 23", "11 ~ 23", "11 ~ 23", "11 ~ 23", "11 ~ 23", "11 ~ 21"], callNumber: 01096080810, tag: ["#실내암벽", "#볼더링", "#빌레이", "#강습", "#주차", "#예약", "#무선인터넷", "#남/녀 화장실", "#지역화폐", "#지역화폐"], parking: "3시간 무료, 4시간 2,000원, 5시간 3,000원, 6시간 4,000원", price: "일일이용권 - 20,000원\n일일체험 - 30,000원\n암벽화 대여 3,000원\n초크 대여 2,000원\n10회권(6개월) - 170,000원\n1개월 이용권 - 120,000원\n3개월 이용권 - 300,000원\n6개월 이용권 - 520,000원\n1개월 강습+이용권 180,000원", reservation: "예약페이지 연결", site: "홈페이지/인스타 연결", grade: [.red, .orange, .yellow, .green, .blue, .systemBlue, .purple, .systemPink, .brown, .white, .gray, .black]),
        
        crag(image: [.blue, .purple, .green], name: "더클라임 양재", introduce: "서울 경기내 최대급 클라이밍 시설!\n하나의 회원권으로 전 지점을 동시에 이용 가능\n초보자부터 상급자까지 모두가 즐길 수 있는 다양한 문제\n각 분야의 다양한 경험을 가진 최고의 강사진\n500문제 이상의 볼더와 지구력 문제\n 매주 70문제 이상의 주기적인 세팅\n편리한 접근성과 개방적인 공간 구성\n요가와 스트레칭을 위한 별도 공간\n다양한 편의 시설과 휴게 공간\n클라이밍 용품을 위한 소매샵", location: "서울 강남구 남부순환로 2615 지하1층", latitude: 37.484959, longitude: 127.03567, numOfSector: "7", changeOfSector: "2주", openingHours: ["10 ~ 20", "10 ~ 23", "10 ~ 23", "10 ~ 23", "10 ~ 23", "10 ~ 23", "10 ~ 20"], callNumber: 025768821, tag: ["#실내암벽", "#볼더링", "#강습", "#주차", "#예약", "#무선인터넷", "#남/녀 화장실", "#지역화폐", "#지역화폐"], parking: "3시간 무료", price: "일일이용권 - 20,000원\n일일체험 - 30,000원\n암벽화 대여 3,000원\n10회권(6개월) - 170,000원\n1개월 이용권 - 130,000원\n3개월 이용권 - 300,000원\n6개월 이용권 - 520,000원\n1개월 강습+이용권 180,000원", reservation: "예약페이지 연결", site: "홈페이지/인스타 연결", grade: [.red, .orange, .yellow, .green, .blue, .systemBlue, .purple, .black])
        
    ]
    
}
