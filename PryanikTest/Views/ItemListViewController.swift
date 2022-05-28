//
//  ViewController.swift
//  PryanikTest
//
//  Created by Roman Zhukov on 26.05.2022.
//

import UIKit

class ItemListViewController: UITableViewController {

    private var itemsData: ItemsData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        
        tableView.register(HzViewCell.self, forCellReuseIdentifier: "hz")
        tableView.register(PictureViewCell.self, forCellReuseIdentifier: "picture")
        tableView.register(SelectorViewCell.self, forCellReuseIdentifier: "selector")
        
        NetworkManager.shared.fetchData { result in
            switch result {
            case .success(let data):
                self.itemsData = data
                self.tableView.reloadData()
//                print(self.itemsData)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        itemsData?.view.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        guard let itemsData = itemsData else { return UITableViewCell() }
        
        var items: [Data] = []
        
        for index in itemsData.view {
            for item in itemsData.data {
                if index == item.name {
                    items.append(item)
                }
            }
        }
        
        let item = items[indexPath.row]
        
        if item.name == "hz" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "hz") as! HzViewCell
            cell.nameLabel.text = item.data.text
            return cell
        } else if item.name == "picture" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "picture") as! PictureViewCell
            cell.nameLabel.text = item.data.text
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "selector") as! SelectorViewCell
            cell.nameLabel.text = item.name
            return cell
        }
        
//        cell.textLabel?.text = item.name
//        return cell
    }
}

extension ItemListViewController {
    func setupNavigationBar() {
        title = "Items"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}