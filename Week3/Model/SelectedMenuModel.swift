//
//  SelectedMenuModel.swift
//  Week3
//
//  Created by Iksang Yoo on 2023/02/10.
//

import Foundation

struct selectedMenuModel {
    var name: String
    var alcohols: [selectedAlcohol]?
    var price: Int
    var size: String
    var totlaPrice: Int
}

struct selectedAlcohol {
    var name: String
    var price: Int
}
