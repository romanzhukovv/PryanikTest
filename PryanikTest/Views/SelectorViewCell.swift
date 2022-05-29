//
//  SelectorViewCell.swift
//  PryanikTest
//
//  Created by Roman Zhukov on 28.05.2022.
//

import UIKit

class SelectorViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SelectorViewCell {
    func configureCell(item: ContentData) {
        var selectorVariants = [String]()
        
        for variant in item.data.variants ?? [] {
            selectorVariants.append(variant.text)
        }
        
        let segmentedControl = UISegmentedControl(items: selectorVariants)
        segmentedControl.selectedSegmentIndex = (item.data.selectedId ?? 0) - 1
        segmentedControl.autoresizingMask = .flexibleWidth
        segmentedControl.addTarget(self, action: #selector(selectorAction(_:)), for: .valueChanged)
        
        contentView.addSubview(segmentedControl)
        
        addConstraints(segmentedControl: segmentedControl)
    }
    
    @objc private func selectorAction(_ segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            print("1")
        case 1:
            print("2")
        case 2:
            print("3")
        default:
            break
        }
    }
    
    private func addConstraints(segmentedControl: UISegmentedControl) {
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            segmentedControl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            segmentedControl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            segmentedControl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            segmentedControl.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15)
        ])
    }
}
