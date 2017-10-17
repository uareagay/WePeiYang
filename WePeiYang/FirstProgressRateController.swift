//
//  ProgressRateController.swift
//  WePeiYang
//
//  Created by 赵家琛 on 2017/9/13.
//  Copyright © 2017年 twtstudio. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class FirstProgressRateController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tabelView: UITableView!
    var subViewOne: UIView!
    var subViewTwo: UIView!
    var subViewThree: UIView!
    var itemRepairLabel: UILabel!
    var itemLabel: UILabel!
    var detailRepairLabel: UILabel!
    var detailLabel: UILabel!
    var locationRepairLabel: UILabel!
    var locationLabel: UILabel!
    var timeRepairLabel: UILabel!
    var timeLabel: UILabel!
    var imageView: UIImageView!
    var labelOne: UILabel!
    var labelTwo: UILabel!
    var labelThree: UILabel!
    var labelFour: UILabel!
    var stateRepairLabel: UILabel!
    var numberRepairLabel: UILabel!
    var stateLabel: UILabel!
    var numberLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 239.0 / 255.0, green: 239.0 / 255.0, blue: 244.0 / 255.0, alpha: 1.0)
        
        subViewOne = UIView(color: .white)
        subViewOne.layer.cornerRadius = 5
        subViewTwo = UIView(color: .white)
        subViewTwo.layer.cornerRadius = 5
        subViewThree = UIView(color: UIColor.gray)
        
        itemRepairLabel = UILabel(text: "报修项目", color: .darkGray)
        itemRepairLabel.font = UIFont.systemFont(ofSize: 11)
        detailRepairLabel = UILabel(text: "补充说明", color: .darkGray)
        detailRepairLabel.font = UIFont.systemFont(ofSize: 11)
        locationRepairLabel = UILabel(text: "维修地点", color: .darkGray)
        locationRepairLabel.font = UIFont.systemFont(ofSize: 11)
        timeRepairLabel = UILabel(text: "报修时间", color: .darkGray)
        timeRepairLabel.font = UIFont.systemFont(ofSize: 11)
        itemLabel = UILabel()
        itemLabel.font = UIFont.systemFont(ofSize: 11)
        itemLabel.textColor = .black
        detailLabel = UILabel()
        detailLabel.font = UIFont.systemFont(ofSize: 11)
        detailLabel.textColor = .black
        locationLabel = UILabel()
        locationLabel.font = UIFont.systemFont(ofSize: 11)
        locationLabel.textColor = .black
        timeLabel = UILabel()
        timeLabel.font = UIFont.systemFont(ofSize: 11)
        timeLabel.textColor = .black
        
//        let image = ImageData.repairHalfImage
//        image?.size = CGSize(width: self.view.bounds.size.width - 10, height: 10)
//        imageView = UIImageView()
//        imageView.image = image.re
        imageView = UIImageView(image: ImageData.updateImage)
        labelOne = UILabel()
        labelTwo = UILabel()
        labelThree = UILabel()
        labelFour = UILabel()
        stateLabel = UILabel()
        numberLabel = UILabel()
        stateRepairLabel = UILabel()
        numberRepairLabel = UILabel()
        
        stateLabel = UILabel()
        stateLabel.font = UIFont.systemFont(ofSize: 11)
        stateLabel.textColor = .black
        
        numberLabel = UILabel()
        numberLabel.font = UIFont.systemFont(ofSize: 11)
        numberLabel.textColor = .black
        
        stateRepairLabel = UILabel(text: "维修状态", color: .darkGray)
        stateRepairLabel.font = UIFont.systemFont(ofSize: 11)
        numberRepairLabel = UILabel(text: "报修单号", color: .darkGray)
        numberRepairLabel.font = UIFont.systemFont(ofSize: 11)
        
        
        subViewOne.addSubview(detailRepairLabel)
        subViewOne.addSubview(itemRepairLabel)
        subViewOne.addSubview(locationRepairLabel)
        subViewOne.addSubview(timeRepairLabel)
        subViewOne.addSubview(itemLabel)
        subViewOne.addSubview(detailLabel)
        subViewOne.addSubview(locationLabel)
        subViewOne.addSubview(timeLabel)
        
        subViewTwo.addSubview(imageView)
        subViewTwo.addSubview(subViewThree)
//        subViewTwo.addSubview(stateLabel)
//        subViewTwo.addSubview(numberLabel)
//        subViewTwo.addSubview(stateRepairLabel)
//        subViewTwo.addSubview(numberRepairLabel)

        self.view.addSubview(subViewOne)
        self.view.addSubview(subViewTwo)
        self.view.addSubview(labelOne)
        self.view.addSubview(labelTwo)
        self.view.addSubview(labelThree)
        self.view.addSubview(labelFour)
        let wid = self.view.bounds.width / 4
        
        subViewOne.snp.makeConstraints { make in
            make.left.equalTo(5)
            make.right.equalTo(-5)
            make.top.equalTo(70)
            make.height.equalTo(90)
        }
        
        subViewTwo.snp.makeConstraints { make in
            make.left.equalTo(5)
            make.right.equalTo(-5)
            make.top.equalTo(165)
            make.height.equalTo(120)
        }
        
        itemRepairLabel.snp.makeConstraints { make in
            make.left.equalTo(8)
            make.width.equalTo(50)
            make.height.equalTo(15)
            make.top.equalTo(6)
        }
        
        detailRepairLabel.snp.makeConstraints { make in
            make.left.equalTo(8)
            make.width.equalTo(50)
            make.height.equalTo(15)
            make.top.equalTo(27)
        }
        
        locationRepairLabel.snp.makeConstraints { make in
            make.left.equalTo(8)
            make.width.equalTo(50)
            make.height.equalTo(15)
            make.bottom.equalTo(-27)
        }
        
        timeRepairLabel.snp.makeConstraints { make in
            make.left.equalTo(8)
            make.width.equalTo(50)
            make.height.equalTo(15)
            make.bottom.equalTo(-6)
        }
        
        
        itemLabel.snp.makeConstraints { make in
            make.left.equalTo(75)
            make.width.equalTo(200)
            make.height.equalTo(15)
            make.top.equalTo(6)
        }
        
        detailLabel.snp.makeConstraints { make in
            make.left.equalTo(75)
            make.width.equalTo(200)
            make.height.equalTo(15)
            make.top.equalTo(27)
        }
        
        locationLabel.snp.makeConstraints { make in
            make.left.equalTo(75)
            make.width.equalTo(200)
            make.height.equalTo(15)
            make.bottom.equalTo(-27)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.left.equalTo(75)
            make.width.equalTo(200)
            make.height.equalTo(15)
            make.bottom.equalTo(-6)
        }
        
        itemLabel.text = "灯管"
        detailLabel.text = "一个灯管坏了"
        locationLabel.text = "诚园7斋A栋427寝室"
        timeLabel.text = "2017-07-12 08:39:07"
        
        imageView.snp.makeConstraints { make in
            make.right.equalTo(0);
            make.top.equalTo(15)
            make.left.equalTo(0)
            make.height.equalTo(0.04 * (self.view.bounds.width - 10))
        }
    
        labelOne.text = "已上报"
        labelOne.textColor = UIColor(red: 0.55, green: 0.78, blue: 0.59, alpha: 1.00)
        //labelOne.alpha = 0.5
        labelOne.textAlignment = .center
        labelOne.font = UIFont.systemFont(ofSize: 10)
        labelOne.snp.makeConstraints { make in
            make.width.equalTo(wid)
            make.height.equalTo(15)
            make.top.equalTo(200)
            make.left.equalTo(0)
        }
        
        labelTwo.text = "已接受"
        labelTwo.textColor = UIColor.black
        labelTwo.alpha = 0.5
        labelTwo.textAlignment = .center
        labelTwo.font = UIFont.systemFont(ofSize: 10)
        labelTwo.snp.makeConstraints { make in
            make.width.equalTo(wid)
            make.height.equalTo(15)
            make.top.equalTo(200)
            make.left.equalTo(wid)
        }
        
        labelThree.text = "已维修"
        labelThree.textColor = UIColor.black
        labelThree.alpha = 0.5
        labelThree.textAlignment = .center
        labelThree.font = UIFont.systemFont(ofSize: 10)
        labelThree.snp.makeConstraints { make in
            make.width.equalTo(wid)
            make.height.equalTo(15)
            make.top.equalTo(200)
            make.left.equalTo(wid * 2)
        }
        
        labelFour.text = "已完成"
        labelFour.textColor = UIColor.black
        labelFour.alpha = 0.5
        labelFour.textAlignment = .center
        labelFour.font = UIFont.systemFont(ofSize: 10)
        labelFour.snp.makeConstraints { make in
            make.width.equalTo(wid)
            make.height.equalTo(15)
            make.top.equalTo(200)
            make.left.equalTo(wid * 3)
        }
        
        subViewThree.snp.makeConstraints { make in
            make.left.equalTo(0);
            make.right.equalTo(0)
            make.height.equalTo(1)
            make.top.equalTo(60)
        }
        subViewThree.alpha = 0.5
        
//        stateLabel.snp.makeConstraints { make in
//            make.left.equalTo(100)
//            make.width.equalTo(250)
//            make.height.equalTo(50)
//            make.top.equalTo(65)
//        }
//        stateLabel.textAlignment = .left
//        stateLabel.lineBreakMode = .byWordWrapping
//        stateLabel.numberOfLines = 0
//        stateLabel.text = "报修信息已提交至维修方，请耐心等候\n（2017-07-13 13:34:09）"
//        
//        numberLabel.snp.makeConstraints { make in
//            make.left.equalTo(100)
//            make.width.equalTo(200)
//            make.height.equalTo(15)
//            make.top.equalTo(115)
//        }
//        numberLabel.text = "12617621231"
//        
//        stateRepairLabel.snp.makeConstraints { make in
//            make.left.equalTo(5)
//            make.width.equalTo(50)
//            make.height.equalTo(15)
//            make.top.equalTo(75)
//        }
//        
//        numberRepairLabel.snp.makeConstraints { make in
//            make.left.equalTo(5)
//            make.width.equalTo(50)
//            make.height.equalTo(15)
//            make.top.equalTo(115)
//        }

        tabelView = UITableView()
        tabelView.register(ListCell.self, forCellReuseIdentifier: "listCell")
        tabelView.separatorStyle = .none
        tabelView.delegate = self
        tabelView.dataSource = self
        tabelView.estimatedRowHeight = 50
        tabelView.rowHeight = UITableViewAutomaticDimension
        tabelView.isScrollEnabled = false
        subViewTwo.addSubview(tabelView)
        tabelView.snp.makeConstraints { make in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.top.equalTo(65)
            make.bottom.equalTo(0)
        }
        
        
        
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
   
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! ListCell
        if(indexPath.row == 0) {
            cell.labelLeft.text = "维修状态"
            cell.labelRight.text = "报修信息已提交至维修方，请耐心等候\n(2017-03-13 13:34:09)"
        } else {
            cell.labelLeft.text = "报修单号"
            cell.labelRight.text = "126326329"
        }
        return cell
    }

    
    
}
