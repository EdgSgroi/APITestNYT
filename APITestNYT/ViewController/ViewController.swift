//
//  ViewController.swift
//  APITestNYT
//
//  Created by Edgar Sgroi on 08/04/20.
//  Copyright © 2020 Edgar Sgroi. All rights reserved.
//

import UIKit
import NotificationCenter

class ViewController: UIViewController {
    
    let viewModel = ViewModel()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(reloadUI), name: .updateList, object: nil)
    }
    
    @objc func reloadUI() {
        tableView.reloadData()
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rowsNumber()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath) as? ArticleTableViewCell {
            cell.title.text = viewModel.getArticleTitle(for: indexPath)
            return cell
        }
        return UITableViewCell()
    }
    
    
}

