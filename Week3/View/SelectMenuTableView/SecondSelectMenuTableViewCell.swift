//
//  SecondSelectMenuTableViewCell.swift
//  Week3
//
//  Created by Iksang Yoo on 2023/02/09.
//

import UIKit

//enum CellUIType {
//    case mainMenu
//    case sideMenu
//    case drinkMenu
//}

class SecondSelectMenuTableViewCell: UITableViewCell {
    
    @IBOutlet weak var view: UIView!
    
    lazy var menuImage : CustomImageView = {
        let image = CustomImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        image.cornerRadius = 5
        return image
    }()
    
    lazy var imageViewOf19 : UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleToFill
        image.image = UIImage(named: "19")
        return image
    }()
    
    lazy var titleLabel : UILabel = {
        let lb = UILabel()
        lb.font = UIFont(name: "Apple SD Gothic Neo Bold", size: 18)
        return lb
    }()
    
    lazy var captionLable : UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 15)
        lb.textColor = .darkGray
        return lb
    }()
    
    lazy var priceLabel : UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 17, weight: .light)
        lb.numberOfLines = 3
        return lb
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI(_ menu: MenuModel, type: ModelType) {
        if type == .main {
            mainMenuUI(menu)
        } else if type == .drink {
            drinkMenuUI(menu)
        } else if type == .side {
            sideMenuUI(menu)
        }
    }
    
    func mainMenuUI (_ menu: MenuModel) {
        view.addSubview(menuImage)
        view.addSubview(titleLabel)
        view.addSubview(captionLable)
        view.addSubview(priceLabel)
        
        menuImage.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        captionLable.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        menuImage.heightAnchor.constraint(equalToConstant: 105).isActive = true
        menuImage.widthAnchor.constraint(equalToConstant: 105).isActive = true
        menuImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 17).isActive = true
        menuImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -17).isActive = true
        menuImage.image = menu.image
        
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 23).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 23).isActive = true
        titleLabel.text = menu.name
        
        captionLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 23).isActive = true
        captionLable.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        captionLable.text = menu.caption
        
        priceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 23).isActive = true
        priceLabel.topAnchor.constraint(equalTo: captionLable.bottomAnchor, constant: 5).isActive = true
        priceLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15).isActive = true
        priceLabel.text = menu.priceText
    }
    
    func sideMenuUI(_ menu: MenuModel) {
        view.addSubview(titleLabel)
        view.addSubview(priceLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 23).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 23).isActive = true
        titleLabel.text = menu.name
        
        priceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 23).isActive = true
        priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        priceLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15).isActive = true
        priceLabel.text = menu.priceText
    }
    
    func drinkMenuUI(_ menu: MenuModel) {
        view.addSubview(titleLabel)
        view.addSubview(priceLabel)
        view.addSubview(imageViewOf19)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        imageViewOf19.translatesAutoresizingMaskIntoConstraints = false

        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 23).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 23).isActive = true
        titleLabel.text = menu.name

        priceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 23).isActive = true
        priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        priceLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15).isActive = true
        priceLabel.text = menu.numberFormatter(number: menu.price!)+"원"
        
        imageViewOf19.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 5).isActive = true
        imageViewOf19.topAnchor.constraint(equalTo: view.topAnchor, constant: 23).isActive = true
    }
}
