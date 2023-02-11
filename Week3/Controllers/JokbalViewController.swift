//
//  JokbalViewController.swift
//  Week3
//
//  Created by Iksang Yoo on 2023/02/06.
//

import UIKit

class JokbalViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let storeTitle = ["냠냠족발&보쌈","미스터보쌈5379","가장맛있는족발"]
    let storeImage = [UIImage(named: "store1"),UIImage(named: "store2"),UIImage(named: "store3")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "StoreListTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "storeListCell")
        
        let headerNib = UINib(nibName: "StoreListHeader", bundle: nil)
        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "StoreListHeader")
        
    }
}

extension JokbalViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) {
            return 3
        } else {
            return 3
        }
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "goToSelectMenuVC", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "storeListCell", for: indexPath) as? StoreListTableViewCell else {
            return UITableViewCell()
        }
        cell.storeImageView.image = storeImage[indexPath.row]
        cell.storeNameLabel.text = storeTitle[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "StoreListHeader") as! StoreListHeader
        if section == 1 {
            header.listLabel.text = "울트라콜"
        }
        return header
    }

}
