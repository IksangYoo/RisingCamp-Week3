//
//  StoreListTableViewCell.swift
//  Week3
//
//  Created by Iksang Yoo on 2023/02/07.
//

import UIKit

class StoreListTableViewCell: UITableViewCell {
    @IBOutlet weak var storeImageView: UIImageView!
    @IBOutlet weak var storeNameLabel: UILabel!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
