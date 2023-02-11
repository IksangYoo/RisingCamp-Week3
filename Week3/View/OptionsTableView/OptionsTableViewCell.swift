//
//  OptionsTableViewCell.swift
//  Week3
//
//  Created by Iksang Yoo on 2023/02/10.
//

import UIKit

class OptionsTableViewCell: UITableViewCell {
    
    lazy var titleLabel : UILabel = {
        let lb = UILabel()
        lb.text = "title"
        lb.font = UIFont.systemFont(ofSize: 19)
        return lb
    }()
    
    lazy var priceLabel : UILabel = {
        let lb = UILabel()
        lb.text = "price"
        lb.font = UIFont.systemFont(ofSize: 19)
        return lb
    }()
    
    lazy var isSelectedImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .center
        
        return imageView
    }()
    
    lazy var imageViewOf19 : UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleToFill
        image.image = UIImage(named: "19")
        return image
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        priceUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func priceUI(_ menu: MenuModel, row: Int) {
        addSubview(titleLabel)
        addSubview(priceLabel)
        addSubview(isSelectedImageView)

        let keySortedDict = menu.priceInfo.sorted(by: {$0.1 < $1.1})
        let keys = keySortedDict.map{$0.0}
        let values = keySortedDict.map{$0.1}
        
        let config = UIImage.SymbolConfiguration(pointSize: 25)
        isSelectedImageView.image = UIImage(systemName: "circle.circle.fill", withConfiguration: config)
        isSelectedImageView.tintColor = #colorLiteral(red: 0.8431373239, green: 0.8431373239, blue: 0.8431373239, alpha: 1)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        isSelectedImageView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.text = keys[row]
        priceLabel.text = "\(values[row])원"
        
        isSelectedImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        isSelectedImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        isSelectedImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25).isActive = true
        isSelectedImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17).isActive = true
        
        titleLabel.centerYAnchor.constraint(equalTo: isSelectedImageView.centerYAnchor, constant: 0).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: isSelectedImageView.trailingAnchor, constant: 10).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 50).isActive = true
        
        priceLabel.centerYAnchor.constraint(equalTo: isSelectedImageView.centerYAnchor, constant: 0).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 370).isActive = true
    }
    
    func alcoholUI(alcoholmenu: MenuModel) {
        addSubview(titleLabel)
        addSubview(priceLabel)
        addSubview(isSelectedImageView)
        addSubview(imageViewOf19)
        
        let config = UIImage.SymbolConfiguration(pointSize: 25)
        isSelectedImageView.image = UIImage(systemName: "checkmark.square.fill", withConfiguration: config)
        isSelectedImageView.tintColor = #colorLiteral(red: 0.8431373239, green: 0.8431373239, blue: 0.8431373239, alpha: 1)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        isSelectedImageView.translatesAutoresizingMaskIntoConstraints = false
        imageViewOf19.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.text = alcoholmenu.name
        priceLabel.text = alcoholmenu.numberFormatter(number: alcoholmenu.price!)+"원"
        
        
        isSelectedImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        isSelectedImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        isSelectedImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25).isActive = true
        isSelectedImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17).isActive = true
        
        titleLabel.centerYAnchor.constraint(equalTo: isSelectedImageView.centerYAnchor, constant: 0).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: isSelectedImageView.trailingAnchor, constant: 10).isActive = true
        
        priceLabel.centerYAnchor.constraint(equalTo: isSelectedImageView.centerYAnchor, constant: 0).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 370).isActive = true
        
        imageViewOf19.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 5).isActive = true
        imageViewOf19.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 23).isActive = true
    }
    
    func updateButtonColor() {
            isSelectedImageView.tintColor = #colorLiteral(red: 0.1570331156, green: 0.7559762597, blue: 0.741653502, alpha: 1)
    }
}

