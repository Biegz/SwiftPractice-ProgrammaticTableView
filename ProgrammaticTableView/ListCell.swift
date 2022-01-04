//
//  ListCell.swift
//  ProgrammaticTableView
//
//  Created by Austin Biegler on 12/5/21.
//

import UIKit

class ListCell: UITableViewCell {
    
    static let identifier = "ListCell"
    
    var cardView = UIView()
    var cellImageView = UIImageView()
    var cellTitleLabel = UILabel()
    var cellPriceLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.25)
        addSubview(cardView)
        configureCardView()
        
        configureImageView()
        configureTitleLabel()
        configurePriceLabel()
        setImageConstraints()
        setTitleLabelConstraints()
        setPriceLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error, init not called.")
    }
    
    func configureCardView() {
        cardView.addSubview(cellImageView)
        cardView.addSubview(cellTitleLabel)
        cardView.addSubview(cellPriceLabel)
        
        cardView.layer.cornerRadius = 4
        cardView.clipsToBounds = true
        cardView.backgroundColor = .white
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        cardView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
    }


    func configureImageView() {
        cellImageView.layer.cornerRadius = 10
        cellImageView.clipsToBounds = true
    }
    
    func configureTitleLabel() {
        cellTitleLabel.numberOfLines = 0
        cellTitleLabel.sizeToFit()
        cellTitleLabel.font = UIFont(name: "SFProText-Semibold", size: 10)
        cellTitleLabel.textColor = .black
    }
    
    func configurePriceLabel() {
        cellPriceLabel.sizeToFit()
        cellPriceLabel.font = UIFont(name: "SFProText-Semibold", size: 8)
        cellPriceLabel.textColor = .darkGray
    }

    func setImageConstraints() {
        cellImageView.translatesAutoresizingMaskIntoConstraints = false
        cellImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        cellImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        cellImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        cellImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func setTitleLabelConstraints() {
        cellTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        cellTitleLabel.topAnchor.constraint(equalTo: cellImageView.topAnchor).isActive = true
        cellTitleLabel.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 8).isActive = true
    }
    
    func setPriceLabelConstraints() {
        cellPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        cellPriceLabel.topAnchor.constraint(equalTo: cellTitleLabel.bottomAnchor, constant: 8).isActive = true
        cellPriceLabel.leadingAnchor.constraint(equalTo: cellTitleLabel.leadingAnchor).isActive = true
    }
    
    func setData(backpack: Backpack) {
        cellImageView.image = UIImage(named: backpack.thumbnail ?? "backpack1")
        cellTitleLabel.text = backpack.title ?? ""
        cellPriceLabel.text = "$" + "\(backpack.price!)"
    }
}
