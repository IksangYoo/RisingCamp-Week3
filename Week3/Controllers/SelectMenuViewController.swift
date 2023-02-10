//
//  SelectMenuViewController.swift
//  Week3
//
//  Created by Iksang Yoo on 2023/02/07.
//

import UIKit

class SelectMenuViewController: UIViewController {
    @IBOutlet weak var tableviewContainer: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableView2: UITableView!
    let model = MenuModel()
    var selectedMenu = MenuModel()
//    var hiddenSections = Set<Int>()
//    var indexPaths = [IndexPath]()
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "SelectMenuTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "selectMenuCell")
        
        let nib2 = UINib(nibName: "SecondSelectMenuTableViewCell", bundle: nil)
        tableView2.register(nib2, forCellReuseIdentifier: "cell")

        let headerNib = UINib(nibName: "SelectMenuTableViewHeader", bundle: nil)
        tableView2.register(headerNib, forHeaderFooterViewReuseIdentifier: "SelectMenuTableViewHeader")
        
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil) // title 부분 수정
        backBarButtonItem.tintColor = .black
        self.navigationItem.backBarButtonItem = backBarButtonItem
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let optionVc = segue.destination as! OptionsViewController
        optionVc.menu = selectedMenu
        
    }
    
}

extension SelectMenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.tableView {
            return 3
        } else {
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.tableView {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "selectMenuCell", for: indexPath) as? SelectMenuTableViewCell else { return UITableViewCell() }
            let menu = model.read(at: indexPath.row, type: .favorite)
            print(menu)
            cell.updateCell(menu: menu)
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? SecondSelectMenuTableViewCell else { return UITableViewCell() }
            if indexPath.section == 0 {
                let menu = model.read(at: indexPath.row, type: .main)
                cell.updateUI(menu, type: .main)
            } else if indexPath.section == 1 {
                let menu = model.read(at: indexPath.row, type: .side)
                cell.updateUI(menu, type: .side)
            } else {
                let menu = model.read(at: indexPath.row, type: .drink)
                cell.updateUI(menu, type: .drink)
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if tableView == tableView2 {
            return 65
        } else {
            return 0
        }
    }
    
  
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == self.tableView {
            selectedMenu = model.read(at: indexPath.row, type: .favorite)
        } else {
            if indexPath.section == 0 {
                selectedMenu = model.read(at: indexPath.row, type: .main)
            } else if indexPath.section == 1 {
                selectedMenu = model.read(at: indexPath.row, type: .side)
            } else if indexPath.section == 2 {
                selectedMenu = model.read(at: indexPath.row, type: .drink)
            }
            print(indexPath.section)
        }
        
        performSegue(withIdentifier: "goToOptions", sender: nil)
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if tableView == tableView2 {
            let header = tableView2.dequeueReusableHeaderFooterView(withIdentifier: "SelectMenuTableViewHeader") as! SelectMenuTableViewHeader
            header.setSectionTitle(title: ["메인 메뉴","사이드 메뉴","주류 메뉴"][section])
//            header.button.tag = section
            
//            // section을 터치했을 때 실행할 메서드 설정(밑에서 구현한다.)
//            header.button.addTarget(self,
//                                    action: #selector(self.hideSection(sender:)),
//                                    for: .touchUpInside)
            return header
        } else {
            return nil
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 3
    }
    
//    @objc private func hideSection(sender: UIButton) {
//        // section의 tag 정보를 가져와서 어느 섹션인지 구분한다.
//        let section = sender.tag
//        let models = [mainMenuModels,sideMenuModels,drikMenuModels]
//        // 특정 섹션에 속한 행들의 IndexPath들을 리턴하는 메서드
//        func indexPathsForSection() -> [IndexPath] {
//            var indexPaths = [IndexPath]()
//
//            for row in 0..<models[section].count {
//                indexPaths.append(IndexPath(row: row,
//                                            section: section))
//            }
//            print(mainMenuModels.count)
//            return indexPaths
//        }
//
//        // 가져온 section이 원래 감춰져 있었다면
//        if self.hiddenSections.contains(section) {
//            // section을 다시 노출시킨다.
//            self.hiddenSections.remove(section)
//            self.tableView.insertRows(at: indexPathsForSection(),
//                                      with: .fade)
//        } else {
//            // section이 원래 노출되어 있었다면 행들을 감춘다.
//            self.hiddenSections.insert(section)
//            self.tableView.deleteRows(at: indexPathsForSection(),
//                                      with: .fade)
//        }
//    }
}
