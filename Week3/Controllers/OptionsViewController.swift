//
//  OptionsViewController.swift
//  Week3
//
//  Created by Iksang Yoo on 2023/02/10.
//

import UIKit

class OptionsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var menu = MenuModel()
    
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    var text: String = ""
    
    @IBOutlet weak var secondCaption: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "OptionsTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        
        name.text = menu.name
        foodImageView.image = menu.image
        
    }
}

extension OptionsViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! OptionsTableViewCell
        if indexPath.section == 0 {
            cell.priceUI()
        } else if indexPath.section == 1{
            cell.optionUI()
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
}
