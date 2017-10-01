  //
//  EvaluateViewController.swift
//  WePeiYang
//
//  Created by 赵家琛 on 2017/9/5.
//  Copyright © 2017年 twtstudio. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class EvaluateViewController: UIViewController, UITextFieldDelegate {
    
    var subView: UIView!
    var evaluateLabel: UILabel!
    var evaluateTextField: UITextField!
    var submitButton: UIButton!
    var starFirstLabel: UILabel!
    var starSecondLabel: UILabel!
    var starThirdLabel: UILabel!
    var starFirstView: ComplaintStarView!
    var starSecondView: ComplaintStarView!
    var starThirdView: ComplaintStarView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let alert = UIAlertController(title: nil, message: "请您认真对维修工作进行评价，这将关系到工人的绩效评定", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "稍后评价", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "现在就去", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        subView = UIView()
        evaluateLabel = UILabel()
        evaluateTextField = UITextField()
        evaluateTextField.delegate = self
        submitButton = UIButton()
        starFirstLabel = UILabel()
        starSecondLabel = UILabel()
        starThirdLabel = UILabel()
        starFirstView = ComplaintStarView(rating: 5, height: 60, tappable: true)
        starSecondView = ComplaintStarView(rating: 5, height: 60, tappable: true)
        starThirdView = ComplaintStarView(rating: 5, height: 60, tappable: true)

        
        
        self.view.addSubview(subView)
        subView.addSubview(evaluateLabel)
        subView.addSubview(evaluateTextField)
        subView.addSubview(submitButton)
        subView.addSubview(starFirstLabel)
        subView.addSubview(starSecondLabel)
        subView.addSubview(starThirdLabel)
        subView.addSubview(starFirstView)
        subView.addSubview(starSecondView)
        subView.addSubview(starThirdView)
        
        starFirstLabel.text = "响应速度"
        starFirstLabel.font = UIFont.systemFont(ofSize: 12)
        
        starFirstLabel.textColor = UIColor.black
        starFirstLabel.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.height.equalTo(20)
            make.top.equalTo(8)
            make.left.equalTo(5)
        }
        
        starFirstView.snp.makeConstraints { make in
            make.left.equalTo(70)
            make.top.equalTo(10)
        }
        
        
        starSecondLabel.text = "服务态度"
        starSecondLabel.font = UIFont.systemFont(ofSize: 12)
        starSecondLabel.textColor = UIColor.black
        starSecondLabel.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.height.equalTo(20)
            make.top.equalTo(40)
            make.left.equalTo(5)
        }
        
        starSecondView.snp.makeConstraints { make in
            make.left.equalTo(70)
            make.top.equalTo(42)
        }

        
        starThirdLabel.text = "维修质量"
        starThirdLabel.font = UIFont.systemFont(ofSize: 12)
        starThirdLabel.textColor = UIColor.black
        starThirdLabel.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.height.equalTo(20)
            make.top.equalTo(72)
            make.left.equalTo(5)
        }
        
        starThirdView.snp.makeConstraints { make in
            make.left.equalTo(70)
            make.top.equalTo(74)
        }

        
        subView.snp.makeConstraints { make in
            make.left.equalTo(8)
            make.right.equalTo(-8)
            make.height.equalTo(270)
            //align your UIView to the bottom of the navigation bar
            //make.top.equalTo(topLayoutGuide.snp.bottom).offset(8)
            make.top.equalTo(70)
        }
        subView.backgroundColor = UIColor.white
        subView.translatesAutoresizingMaskIntoConstraints = false
        
        
        evaluateLabel.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.width.equalTo(150)
            make.left.equalTo(5)
            make.top.equalTo(115)
        }
        evaluateLabel.text = "文字补充（30字）"
        evaluateLabel.textColor = UIColor.black
        evaluateLabel.backgroundColor = UIColor.white
        evaluateLabel.font = UIFont.systemFont(ofSize: 12)
        
        evaluateTextField.snp.makeConstraints { make in
            make.left.equalTo(5)
            make.right.equalTo(-5)
            make.height.equalTo(30)
            make.top.equalTo(140)
        }
        evaluateTextField.font = UIFont.systemFont(ofSize: 11)
        evaluateTextField.textColor = UIColor.black
        evaluateTextField.backgroundColor = UIColor.white
        evaluateTextField.placeholder = "  很棒，给维修师傅点个赞～"
        evaluateTextField.textAlignment = .left
        evaluateTextField.borderStyle = .line
        evaluateTextField.layer.borderColor = UIColor(red:0.89, green:0.89, blue:0.89, alpha:1.00).cgColor
        evaluateTextField.layer.borderWidth = 1
        
        
        
        
        submitButton.snp.makeConstraints { make in
            make.width.equalTo(70)
            make.height.equalTo(30)
            make.centerX.equalTo(subView)
            make.top.equalTo(220)
        }
        submitButton.backgroundColor = UIColor(red: 254.0 / 255.0, green: 210.0 / 255.0, blue: 44.0 / 255.0, alpha: 1.0)
        submitButton.setTitleColor(UIColor.black, for: .normal)
        submitButton.setTitle("提交", for: .normal)
        submitButton.layer.cornerRadius = 5
        submitButton.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        self.view.backgroundColor = UIColor(red: 239.0 / 255.0, green: 239.0 / 255.0, blue: 244.0 / 255.0, alpha: 1.0)
        self.title = "评价"
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newLength = (textField.text?.utf16.count)! + string.utf16.count - range.length
//        print("\((textField.text?.utf16.count)!)  \(string.utf16.count)  \(range.length)  \(newLength)")
        return newLength <= 30
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
  
//  class A {
//    var kk: (() -> Void)?
//    func someMethod(sb: @escaping () -> Void) {
//        self.kk = sb
//    }
//  }
//  
//  class B {
//    var number = 0;
//    var a: A = A()
//    func anotherMethod() {
//        a.someMethod {
//            self.number = 10
//        }
//    }
//  }
//  
  
  
  
  
