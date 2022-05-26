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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        NetworkManager.shared.fetchData { result in
            switch result {
            case .success(let data):
                self.itemsData = data
                print(self.itemsData)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "fsdfsdf"
        return cell
    }
}

extension ItemListViewController {
    func setupNavigationBar() {
        title = "Items"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
