//
//  SelectMenuTableViewCell.swift
//  Week3
//
//  Created by Iksang Yoo on 2023/02/08.
//

import UIKit

class SelectMenuTableViewCell: UITableViewCell {
    
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var foodImage: CustomImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func updateCell(menu: MenuModel) {
        captionLabel.text = menu.caption
        foodImage.image = menu.image
        priceLabel.text = menu.price
        nameLabel.text = menu.name
    }
    
}
