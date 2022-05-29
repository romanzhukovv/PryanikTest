//
//  PictureViewCell.swift
//  PryanikTest
//
//  Created by Roman Zhukov on 28.05.2022.
//

import UIKit

class PictureViewCell: UITableViewCell {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    let pryanikImage = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        pryanikImage.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(pryanikImage)
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15)
        ])
        
        NSLayoutConstraint.activate([
            pryanikImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            pryanikImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            pryanikImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            pryanikImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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
}
