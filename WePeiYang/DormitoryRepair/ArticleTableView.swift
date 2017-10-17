//
//  ArticleTableView.swift
//  WePeiYang
//
//  Created by 赵家琛 on 2017/9/5.
//  Copyright © 2017年 twtstudio. All rights reserved.
//

import Foundation
import UIKit

class ArticleTableView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    var button: UIButton!
    var articles: [Article] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.register(ArticleTableViewCell.self, forCellReuseIdentifier: "articleCell")
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 110
        self.view.addSubview(tableView)
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 254.0 / 255.0, green: 210.0 / 255.0, blue: 44.0 / 255.0, alpha: 1.0)
        self.title = "宿舍报修"
        self.navigationController?.navigationBar.tintColor = UIColor.black

        
        //button = UIButton(frame: CGRect(x: 285, y: 535, width: 58, height: 58))
        button = UIButton()
        button.backgroundColor = UIColor(red: 254.0 / 255.0, green: 210.0 / 255.0, blue: 44.0 / 255.0, alpha: 1.0)
        
        self.view.addSubview(button)
        button.snp.makeConstraints { make in
            make.width.equalTo(58)
            make.height.equalTo(58)
            make.top.equalTo(self.view.bounds.height * 8 / 10)
            make.left.equalTo(self.view.bounds.width * 7.5 / 10)
        }
        button.setImage(ImageData.repairToolImage, for: .normal)
        button.imageEdgeInsets = UIEdgeInsetsMake(14, 14, 14, 14)
        //button.layer.cornerRadius = button.frame.size.width / 2
        button.layer.cornerRadius = 58 / 2
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(toSubmit), for: .touchUpInside)
        
        print(TwTUser.shared.token ?? "fuck you TWT token")
        fetchArticles()
        print("\(self.articles.count)ascas")
    }
    
    func toSubmit() {
        let rvc = SubmitViewController()
        
        let item = UIBarButtonItem(title: "我要报修", style: .plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem = item
        
        self.navigationController?.pushViewController(rvc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath) as! ArticleTableViewCell
        cell.itemDetailInformationLabel.text = self.articles[indexPath.row].detailRepair
        cell.itemLabel.text = self.articles[indexPath.row].itemsRepair
        cell.dateLabel.text = self.articles[indexPath.row].submitTimeRepair
        let sta = self.articles[indexPath.row].situationRepair
        cell.progressLabel.text = sta
        if(sta == "已投诉") {
            cell.progressLabel.textColor = UIColor.red
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rvc = EvaluateViewController()
        self.navigationController?.pushViewController(rvc, animated: true)
    }
    
    func fetchArticles() {
        
        GetRepairApi.getRepair(success: { (lists) in
            print("aaaaaaa")
            self.articles = lists
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }, failure: { error in
            print("fuck")
        })
        
        /*GetRepairApi.getDormitory(success: { (lists) in
            
        }, failure: { error in
            print(error)
        })*/
        
        
        
    }
    
    
}


//class Article: NSObject {
//    var itemsRepair: String?
//    var detailRepair: String?
//    var locationRepair: String?
//    var submitTimeRepair: String?
//    var situationRepair: String?
//    var idRepair: String?
//    var accendantRepair: String?
//    var phone: String?
//    var predictedRepair: String?
//}
//
////报修项目
////补充说明
////维修地点
////报修时间
////维修状态
////报修单号
////维修负责人
////联系电话
////预计维修时间
//
