//
//  ScheduleModel.swift
//  ClimbingDiary
//
//  Created by Joonhwan Jeon on 2022/06/18.
//

import UIKit

class ScheduleModel {
    let selectDate: Observable<String> = Observable("")
    let selectCrag: Observable<String> = Observable("")
    
    var cityList = CityInformation()
    var cragList = CragInformation()
    
    var cityCode: Observable<Int> = Observable(11)
    
    var targetCrag = CragInformation().cragList
    var selectGrade: [UIColor] = []
    var selectSector: [String] = []
}
