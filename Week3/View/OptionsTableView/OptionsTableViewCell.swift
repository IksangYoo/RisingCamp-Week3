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
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        priceUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func priceUI() {
        addSubview(titleLabel)
        addSubview(priceLabel)
        addSubview(isSelectedImageView)
        
        let config = UIImage.SymbolConfiguration(pointSize: 25)
        isSelectedImageView.image = UIImage(systemName: "circle.circle.fill", withConfiguration: config)
        isSelectedImageView.tintColor = #colorLiteral(red: 0.8431373239, green: 0.8431373239, blue: 0.8431373239, alpha: 1)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        isSelectedImageView.translatesAutoresizingMaskIntoConstraints = false
        
        isSelectedImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        isSelectedImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        isSelectedImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25).isActive = true
        isSelectedImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17).isActive = true
        
        titleLabel.centerYAnchor.constraint(equalTo: isSelectedImageView.centerYAnchor, constant: 0).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: isSelectedImageView.trailingAnchor, constant: 10).isActive = true

        priceLabel.centerYAnchor.constraint(equalTo: isSelectedImageView.centerYAnchor, constant: 0).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 370).isActive = true
    }
    
    func optionUI() {
        addSubview(titleLabel)
        addSubview(priceLabel)
        addSubview(isSelectedImageView)
        
        let config = UIImage.SymbolConfiguration(pointSize: 25)
        isSelectedImageView.image = UIImage(systemName: "checkmark.square.fill", withConfiguration: config)
        isSelectedImageView.tintColor = #colorLiteral(red: 0.8431373239, green: 0.8431373239, blue: 0.8431373239, alpha: 1)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        isSelectedImageView.translatesAutoresizingMaskIntoConstraints = false
        
        isSelectedImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        isSelectedImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        isSelectedImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25).isActive = true
        isSelectedImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17).isActive = true
        
        titleLabel.centerYAnchor.constraint(equalTo: isSelectedImageView.centerYAnchor, constant: 0).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: isSelectedImageView.trailingAnchor, constant: 10).isActive = true

        priceLabel.centerYAnchor.constraint(equalTo: isSelectedImageView.centerYAnchor, constant: 0).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 370).isActive = true
    }
}

