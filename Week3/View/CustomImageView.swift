//
//  CustomImageView.swift
//  Week3
//
//  Created by Iksang Yoo on 2023/02/08.
//

import Foundation
import UIKit

class CustomImageView: UIImageView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}
