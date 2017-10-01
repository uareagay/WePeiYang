//
//  FourProgressRateController.swift
//  WePeiYang
//
//  Created by 赵家琛 on 2017/9/29.
//  Copyright © 2017年 twtstudio. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class FourProgressRateController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
    var ButtonLeft: UIButton!
    var ButtonRight: UIButton!
    
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
        imageView = UIImageView(image: ImageData.repairHalfImage)
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
            make.height.equalTo(230)
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
        labelOne.textColor = UIColor.green
        labelOne.alpha = 0.5
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
            make.bottom.equalTo(-35)
        }
        
        ButtonLeft = UIButton(title: "维修完成，去评价")
        ButtonLeft.setTitleColor(UIColor.black, for: .normal)
        subViewTwo.addSubview(ButtonLeft)
        ButtonLeft.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        ButtonLeft.layer.cornerRadius = 5
        ButtonLeft.backgroundColor = UIColor(red: 254.0 / 255.0, green: 210.0 / 255.0, blue: 44.0 / 255.0, alpha: 1.0)
        ButtonLeft.snp.makeConstraints { make in
            make.centerX.equalTo(self.view.bounds.width / 4 + 20)
            make.width.equalTo(100)
            make.height.equalTo(25)
            make.bottom.equalTo(-5)
        }
        
        ButtonRight = UIButton(title: "有疑问？去投诉")
        subViewTwo.addSubview(ButtonRight)
        ButtonRight.layer.borderWidth = 0.5
        ButtonRight.layer.borderColor = UIColor.darkGray.cgColor
        ButtonRight.setTitleColor(UIColor.black, for: .normal)
        ButtonRight.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        ButtonRight.layer.cornerRadius = 5
        ButtonRight.snp.makeConstraints { make in
            make.centerX.equalTo(self.view.bounds.width * 3 / 4 - 20)
            make.width.equalTo(100)
            make.height.equalTo(25)
            make.bottom.equalTo(-5)
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! ListCell
        if(indexPath.row == 0) {
            cell.labelLeft.text = "维修状态"
            cell.labelRight.text = "维修方已接受报修信息\n(2016-07-13 14:04:29)\n报修信息已提交至维修方，请耐心等候\n(2017-03-13 13:34:09)\n已确认维修完成\n(2015-03-23 14:04:29)"
        } else if(indexPath.row == 1) {
            cell.labelLeft.text = "报修单号"
            cell.labelRight.text = "126326329"
        } else if(indexPath.row == 2) {
            cell.labelLeft.text = "维修负责人"
            cell.labelRight.text = "王师傅"
        } else {
            cell.labelLeft.text = "联系电话"
            cell.labelRight.text = "1623761253"
        }
        
        return cell
    }
    
}
