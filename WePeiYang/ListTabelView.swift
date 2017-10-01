//
//  ListTabelView.swift
//  WePeiYang
//
//  Created by 赵家琛 on 2017/9/23.
//  Copyright © 2017年 twtstudio. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class ListTabelView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.register(ListCell.self, forCellReuseIdentifier: "articleCell")
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 25
        tableView.rowHeight = UITableViewAutomaticDimension
        self.view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath) as! ListCell
        if(indexPath.row == 1) {
            cell.labelRight.text = "saca"
        }
        return cell
    }
    
    
    
}
