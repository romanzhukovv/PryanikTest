//
//  PictureViewCell.swift
//  PryanikTest
//
//  Created by Roman Zhukov on 28.05.2022.
//

import UIKit

class PictureViewCell: UITableViewCell {
    
    private let nameLabel = UILabel()
    private let pryanikImage = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(pryanikImage)
        contentView.addSubview(nameLabel)
        
        addConstraits()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PictureViewCell {
    func configureCell(item: ContentData) {
        NetworkManager.shared.fetchImage(from: item.data.url ?? "") { result in
            switch result {
            case .success(let data):
                self.pryanikImage.image = UIImage(data: data)
            case .failure(let error):
                print(error)
            }
        }
        
        nameLabel.text = item.data.text
    }
    
    private func addConstraits() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        pryanikImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pryanikImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            pryanikImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            pryanikImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            pryanikImage.widthAnchor.constraint(equalToConstant: contentView.bounds.size.width / 4),
            pryanikImage.widthAnchor.constraint(equalTo: pryanikImage.heightAnchor, multiplier: 1),
            
            nameLabel.leadingAnchor.constraint(equalTo: pryanikImage.trailingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 20),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
