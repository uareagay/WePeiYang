//
//  ListCell.swift
//  WePeiYang
//
//  Created by 赵家琛 on 2017/9/23.
//  Copyright © 2017年 twtstudio. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class ListCell: UITableViewCell {
    
    var labelLeft: UILabel!
    var labelRight: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        labelLeft = UILabel()
        labelRight = UILabel()
        
        contentView.addSubview(labelLeft)
        contentView.addSubview(labelRight)
        
        labelLeft.snp.makeConstraints { make in
            make.left.equalTo(8)
            make.top.equalTo(5)
            make.width.equalTo(70)
            make.height.equalTo(10)
        }
//        labelLeft.text = "dsvesdvsv"
        labelLeft.font = UIFont.systemFont(ofSize: 11)
        labelLeft.textColor = UIColor.gray
        
        labelRight.snp.makeConstraints { make in
            make.right.equalTo(0)
            make.left.equalTo(100)
            make.top.equalTo(3)
            make.bottom.equalTo(0)
        }
        labelRight.lineBreakMode = .byWordWrapping
        labelRight.numberOfLines = 0
//        labelRight.text = "jkgvnjrjagvnj\naafbv\narva\nrba\narva\narvrav]nrabvabv]narbvab]nrgvara]mrabr\nraegrae\nragvarwgvaw\nwrgwagvawg\ngvwa"
        labelRight.font = UIFont.systemFont(ofSize: 11)
        labelRight.adjustsFontSizeToFitWidth = true
        labelRight.textColor = UIColor.black
        
        self.selectionStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
