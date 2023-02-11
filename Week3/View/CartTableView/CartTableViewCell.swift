//
//  CartTableViewCell.swift
//  Week3
//
//  Created by Iksang Yoo on 2023/02/10.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    @IBOutlet weak var stepperView: UIView!
    @IBOutlet weak var changeOptionButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        changeOptionButton.layer.cornerRadius = 4
        changeOptionButton.layer.borderWidth = 0.5
        changeOptionButton.layer.borderColor = #colorLiteral(red: 0.7231323242, green: 0.7231323242, blue: 0.7231323242, alpha: 1)
        stepperView.layer.borderWidth = 1
        stepperView.layer.borderColor = #colorLiteral(red: 0.7231323242, green: 0.7231323242, blue: 0.7231323242, alpha: 1)
        stepperView.layer.cornerRadius = 4
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
