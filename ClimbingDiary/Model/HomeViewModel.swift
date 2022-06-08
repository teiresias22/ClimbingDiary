//
//  HomeViewModel.swift
//  ClimbingDiary
//
//  Created by Joonhwan Jeon on 2022/06/01.
//

import Foundation
import UIKit

class HomeViewModel {
    
    var homeListTitle: Observable<String> = Observable("@@@@@@@@")
    var homeListImage: UIColor = .black
    
    var homeDetailNo = CragInformation.init().cragList[0]
    
}
