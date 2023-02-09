//
//  MenuModel.swift
//  Week3
//
//  Created by Iksang Yoo on 2023/02/09.
//

import Foundation
import UIKit

enum ModelType {
    case favorite
    case main
    case side
    case drink
    
    var models : [MenuModel] {
        switch self {
        case .favorite: return [MenuModel(image: UIImage(named: "food1")!, name: "왕족발", caption: "김치+무말랭이+쌈+콩나물국", price: "25,000원 ~ 35,000원"),MenuModel(image: UIImage(named: "food2")!, name: "보쌈", caption: "김치+무말랭이+쌈+콩나물국", price: "25,000원 ~ 35,000원"),MenuModel(image: UIImage(named: "food3")!, name: "왕족발", caption: "김치+무말랭이+쌈+콩나물국", price: "4,000원 ~ 55,000원")]
        case .main: return [MenuModel(image: UIImage(named: "food1")!, name: "왕족발", caption: "김치+무말랭이+쌈+콩나물국", price: "2인: 25,000원\n3인: 30,0000원\n4인: 35,000원"),MenuModel(image: UIImage(named: "food2")!, name: "보쌈", caption: "김치+무말랭이+쌈+콩나물국", price: "소: 25,000원\n중: 30,0000원\n대: 35,000원"),MenuModel(image: UIImage(named: "food3")!, name: "왕족발", caption: "김치+무말랭이+쌈+콩나물국", price: "중: 40,000원\n대: 45,0000원\n특대: 55,000원")]
        case .side: return [MenuModel(image: nil, name: "매콤껍데기", price: "10,000원"),MenuModel(image: nil, name: "공기밥", price: "1,000원"),MenuModel(image: nil, name: "매콤닭발", price: "소: 10,000원\n중: 15000")]
        case .drink: return [MenuModel(name: "참이슬", price: "4,000원"),MenuModel(name: "처음처럼", price: "4,000원"),MenuModel(name: "카스", price: "4,000원")]
        }
    }
}

struct MenuModel {
    var image : UIImage?
    var name: String?
    var caption: String?
    var price: String?
    
    func read(at: Int, type: ModelType) -> MenuModel {
        return type.models[at]
    }
}
