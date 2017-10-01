//
//  sss.swift
//  WePeiYang
//
//  Created by 赵家琛 on 2017/9/4.
//  Copyright © 2017年 twtstudio. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
class ViewController: UIViewController {
    var bb: UIButton!
    var sV: StarView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.green
        //self.desiredNavigationBarTitleColor = UIColor.blue
        //self.navigationController?.navigationBar.setBackgroundImage(UIImage(color: .yellow), for: .default)
        self.navigationController?.navigationBar.barTintColor = UIColor.yellow

        self.navigationController?.navigationBar.tintColor = UIColor.black
        sV = StarView(rating: 1, height: 36, tappable: true)
        self.view.addSubview(sV)
        sV.snp.makeConstraints { make in
            //make.width.equalTo(350)
            make.centerX.equalTo(view)
            make.top.equalTo(200)
            
        }
        
        
        bb = UIButton()
        self.view.addSubview(bb)
        bb.backgroundColor = UIColor.white
        bb.snp.makeConstraints { make in
            make.width.height.equalTo(60)
            make.top.equalTo(300)
            make.centerX.equalTo(view)
            
        }
        bb.addTarget(self, action: #selector(asd), for: .touchUpInside)
        
        //navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.black]
    }
    
    func asd() {
        print(sV.rating)
    }
}








