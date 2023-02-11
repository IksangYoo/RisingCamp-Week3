//
//  OptionsViewController.swift
//  Week3
//
//  Created by Iksang Yoo on 2023/02/10.
//

import UIKit

class OptionsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var stepperView: UIView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    
    var menu = MenuModel()
    let alcoholMenu = ModelType.drink.models
    var foodPrice : Int = 25000
    var alcoholPrice: Int = 0
    var totalPrice : Int = 0
    var isFoodSelected = [true,false,false]
    var isAlcoholSelected = [false, false, false]
    var numofMenu = 1
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var secondCaption: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "OptionsTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        
        let header = UINib(nibName: "OptionsHeaderView", bundle: nil)
        tableView.register(header, forHeaderFooterViewReuseIdentifier: "OptionsHeaderView")
//        print(alcoholMenu)
        stepperView.layer.borderWidth = 1
        stepperView.layer.borderColor = #colorLiteral(red: 0.7231323242, green: 0.7231323242, blue: 0.7231323242, alpha: 1)
        stepperView.layer.cornerRadius = 25
        addButton.layer.cornerRadius = 5
        name.text = menu.name
        foodImageView.image = menu.image
        
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil) // title 부분 수정
        backBarButtonItem.tintColor = .black
        self.navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    @IBAction func plusButtonClicked(_ sender: UIButton) {
        numofMenu+=1
        minusButton.isEnabled = true
        minusButton.tintColor = .black
        addButton.setTitle(numberFormatter(number: totalPrice*numofMenu)+"원 담기", for: .normal)
        countLabel.text = "\(numofMenu)개"
    }
    
    @IBAction func minusButtonClicked(_ sender: UIButton) {
        numofMenu-=1
        if numofMenu == 1 {
            minusButton.tintColor = .lightGray
            minusButton.isEnabled = false
        }
        addButton.setTitle(numberFormatter(number: totalPrice*numofMenu)+"원 담기", for: .normal)
        countLabel.text = "\(numofMenu)개"
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToCart", sender: nil)
    }
    func numberFormatter(number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: number))!
    }
}

extension OptionsViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! OptionsTableViewCell
        if indexPath.section == 0 {
            cell.priceUI(menu, row: indexPath.row)
        } else if indexPath.section == 1{
            cell.alcoholUI(alcoholmenu: alcoholMenu[indexPath.row])
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
 
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "OptionsHeaderView") as! OptionsHeaderView
        if section == 0 {
            header.headerTitleLabel.text = "가격"
        } else {
            header.headerTitleLabel.text = "주류선택 (최대 3개)"
        }
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        // UIView with darkGray background for section-separators as Section Footer
        let v = UIView(frame: CGRect(x: 0, y:0, width: tableView.frame.width, height: 0.5))
        v.backgroundColor = #colorLiteral(red: 0.7017046809, green: 0.7017046809, blue: 0.7017046809, alpha: 1)
        return v
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        // Section Footer height
        return 0.5
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" ,for: indexPath) as! OptionsTableViewCell
        
        let keySortedDict = menu.priceInfo.sorted(by: {$0.1 < $1.1})
        let keys = keySortedDict.map{$0.1}
        
        if indexPath.section == 0 {
            isFoodSelected = [false,false,false]
            
            if isFoodSelected[indexPath.row] {
            } else {
                isFoodSelected[indexPath.row] = !isFoodSelected[indexPath.row]
                foodPrice = keys[indexPath.row]
            }
            print(isFoodSelected)
            
        } else if indexPath.section == 1 {
            if isAlcoholSelected[indexPath.row] {
                alcoholPrice -= alcoholMenu[indexPath.row].price!
            } else {
                alcoholPrice += alcoholMenu[indexPath.row].price!
            }
            cell.updateButtonColor()
            isAlcoholSelected[indexPath.row] = !isAlcoholSelected[indexPath.row]
        }
        
        totalPrice = foodPrice + alcoholPrice
        addButton.setTitle(numberFormatter(number: totalPrice)+"원 담기", for: .normal)
    }
}
