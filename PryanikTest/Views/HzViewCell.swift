//
//  HzViewCell.swift
//  PryanikTest
//
//  Created by Roman Zhukov on 28.05.2022.
//

import UIKit

class HzViewCell: UITableViewCell {
    
    private let nameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        nameLabel.numberOfLines = 0
        
        contentView.addSubview(nameLabel)
        
        addConstraits()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HzViewCell {
    func configureCell(item: ContentData) {
        nameLabel.text = item.data.text
    }
    
    private func addConstraits() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15)
        ])
    }
}
