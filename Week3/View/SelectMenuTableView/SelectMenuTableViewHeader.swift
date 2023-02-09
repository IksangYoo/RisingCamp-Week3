//
//  SelectMenuTableViewHeader.swift
//  Week3
//
//  Created by Iksang Yoo on 2023/02/09.
//

import UIKit

class SelectMenuTableViewHeader: UITableViewHeaderFooterView {

    @IBOutlet weak var sectionTitle: UILabel!
    @IBOutlet weak var view: UIView!
    
    
    func setSectionTitle(title: String) {
        sectionTitle.text = title
    }

}
