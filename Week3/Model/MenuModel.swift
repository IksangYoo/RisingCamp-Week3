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
        case .favorite: return [MenuModel(image: UIImage(named: "food1")!, name: "왕족발", caption: "김치+무말랭이+쌈+콩나물국", priceText: "25,000원 ~ 35,000원",priceInfo: ["2인":25000,"3인":30000,"4인":35000]),MenuModel(image: UIImage(named: "food2")!, name: "보쌈", caption: "김치+무말랭이+쌈+콩나물국", priceText: "25,000원 ~ 35,000원", priceInfo: ["소":25000,"중":30000,"대":35000]),MenuModel(image: UIImage(named: "food3")!, name: "족발+보쌈", caption: "김치+무말랭이+쌈+콩나물국", priceText: "4,0000원 ~ 55,000원", priceInfo: ["중":40000,"대":45000,"특대":55000])]
            
        case .main: return [MenuModel(image: UIImage(named: "food1")!, name: "왕족발", caption: "김치+무말랭이+쌈+콩나물국", priceText: "2인: 25,000원\n3인: 30,0000원\n4인: 35,000원",priceInfo: ["2인":25000,"3인":30000,"4인":35000]),MenuModel(image: UIImage(named: "food2")!, name: "보쌈", caption: "김치+무말랭이+쌈+콩나물국", priceText: "소: 25,000원\n중: 30,0000원\n대: 35,000원",priceInfo: ["소":25000,"중":30000,"대":35000]),MenuModel(image: UIImage(named: "food3")!, name: "족발+보쌈", caption: "김치+무말랭이+쌈+콩나물국", priceText: "중: 40,000원\n대: 45,0000원\n특대: 55,000원",priceInfo: ["중":40000,"대":45000,"특대":55000])]
            
        case .side: return [MenuModel(image: nil, name: "매콤껍데기", priceText: "10,000원"),MenuModel(image: nil, name: "공기밥", priceText: "1,000원"),MenuModel(image: nil, name: "매콤닭발", priceText: "소: 10,000원\n중: 15,000원")]
            
        case .drink: return [MenuModel(name: "참이슬", price: 4000),MenuModel(name: "처음처럼", price: 4500),MenuModel(name: "카스", price: 5000)]
        }
    }
}

struct MenuModel {
    
    var image : UIImage?
    var name: String = ""
    var caption: String?
    var priceText: String = ""
    var price: Int?
    var priceInfo: [String:Int] = ["":0]
    
    func read(at: Int, type: ModelType) -> MenuModel {
        return type.models[at]
    }
    
    func numberFormatter(number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: number))!
    }
}
