//
//  SubmitViewController.swift
//  WePeiYang
//
//  Created by 赵家琛 on 2017/9/5.
//  Copyright © 2017年 twtstudio. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class SubmitViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var subView: UIView!
    var submitWarningLabel: UILabel!
    var submitLocation: UILabel!
    var submitInformation: UILabel!
    var submitInformationDetail: UILabel!
    var submitImageLabel: UILabel!
    var submitPeopleLabel: UILabel!
    var submitButton: UIButton!
    var buildingTextField: UITextField!
    var roomTextField: UITextField!
    var itemTextField: UITextField!
    var submitInformationDetailTextField: UITextField!
    var buildingOption = ["正园九斋", "正园十斋", "齐园六斋"]
    var roomOption = ["219", "220", "432"]
    var itemOption = ["椅子", "墙壁", "水龙头"]
    var nameTextField: UITextField!
    var telephoneTextField: UITextField!
    var submitImageButton: UIButton!
    var imageOfSubmit: UIImage = ImageData.rapairPhotoImage!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
//        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(sender:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
//        
//        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(sender:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        var buildingPickerView = UIPickerView()
        buildingPickerView.delegate = self
        var roomPickerView = UIPickerView()
        roomPickerView.delegate = self
        var itemPickerView = UIPickerView()
        itemPickerView.delegate = self
        //
        buildingTextField = UITextField()
        buildingTextField.placeholder = "宿舍楼"
        buildingTextField.font = UIFont.systemFont(ofSize: 12)
        buildingTextField.inputView = buildingPickerView
        buildingTextField.borderStyle = .roundedRect
        roomTextField = UITextField()
        roomTextField.borderStyle = .roundedRect
        roomTextField.placeholder = "房间"
        roomTextField.font = UIFont.systemFont(ofSize: 12)
        roomTextField.inputView = roomPickerView
        itemTextField = UITextField()
        itemTextField.borderStyle = .roundedRect
        itemTextField.placeholder = "报修项目"
        itemTextField.font = UIFont.systemFont(ofSize: 12)
        itemTextField.inputView = itemPickerView
        
        
        subView = UIView()
        submitWarningLabel = UILabel()
        submitLocation = UILabel()
        submitInformation = UILabel()
        submitInformationDetail = UILabel()
        submitImageLabel = UILabel()
        submitPeopleLabel = UILabel()
        submitButton = UIButton()
        submitInformationDetailTextField = UITextField()
        submitInformationDetailTextField.delegate = self
        nameTextField = UITextField()
        telephoneTextField = UITextField()
        nameTextField.delegate = self
        telephoneTextField.delegate = self
        submitImageButton = UIButton()
        
        subView.addSubview(submitLocation)
        subView.addSubview(submitInformation)
        subView.addSubview(submitInformationDetail)
        subView.addSubview(submitImageLabel)
        subView.addSubview(submitWarningLabel)
        subView.addSubview(submitPeopleLabel)
        subView.addSubview(submitButton)
        subView.addSubview(submitInformationDetailTextField)
        subView.addSubview(nameTextField)
        subView.addSubview(telephoneTextField)
        subView.addSubview(submitImageButton)
        self.view.addSubview(subView)
        
        //
        subView.addSubview(buildingTextField)
        subView.addSubview(roomTextField)
        subView.addSubview(itemTextField)
        buildingTextField.snp.makeConstraints { make in
            make.height.equalTo(25)
            //make.width.equalTo(120)
            make.right.equalTo(self.subView.snp.centerX).offset(-5)
            make.top.equalTo(95)
            make.left.equalTo(15)
        }
        roomTextField.snp.makeConstraints { make in
            make.height.equalTo(25)
            //make.width.equalTo(120)
            make.left.equalTo(self.subView.snp.centerX).offset(5)
            make.top.equalTo(95)
            make.right.equalTo(-15)
        }
        itemTextField.snp.makeConstraints { make in
            make.height.equalTo(25)
            make.top.equalTo(150)
            make.left.equalTo(15)
            make.right.equalTo(-15)
        }
        
        subView.frame = view.bounds
        subView.backgroundColor = UIColor.white
        
        submitLocation.text = "报修区域（暂只支持新校区）"
        submitLocation.font = UIFont.systemFont(ofSize: 12)
        submitLocation.textColor = UIColor.black
        submitLocation.alpha = 0.5
        submitLocation.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(20)
            make.top.equalTo(70)
            make.left.equalTo(15)
        }
        
        submitInformation.text = "报修信息"
        submitInformation.textColor = UIColor.black
        submitInformation.font = UIFont.systemFont(ofSize: 12)
        submitInformation.alpha = 0.5
        submitInformation.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(20)
            make.top.equalTo(125)
            make.left.equalTo(15)
        }
        
        submitInformationDetail.text = "补充描述（30字，必填）"
        submitInformationDetail.textColor = UIColor.black
        submitInformationDetail.font = UIFont.systemFont(ofSize: 12)
        submitInformationDetail.alpha = 0.5
        submitInformationDetail.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(20)
            make.top.equalTo(180)
            make.left.equalTo(15)
        }
        
        let attrSubmitString = NSMutableAttributedString(string: "说明损坏程度、部位等信息，以帮助维修师傅更好的完成维修工作哦～*", attributes: [NSForegroundColorAttributeName: UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0)])
        let submitRangeFirst = NSRange(location: 31, length: 1)
        let submitRangeSecond = NSRange(location: 0, length: 32)
        attrSubmitString.addAttributes([NSFontAttributeName: UIFont.systemFont(ofSize: 10)], range: submitRangeSecond)
        attrSubmitString.addAttributes([NSForegroundColorAttributeName: UIColor.red], range: submitRangeFirst)
        submitInformationDetailTextField.attributedPlaceholder = attrSubmitString
        submitInformationDetailTextField.snp.makeConstraints { make in
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(35)
            make.top.equalTo(205)
        }
        submitInformationDetailTextField.font = UIFont.systemFont(ofSize: 10)
        submitInformationDetailTextField.borderStyle = .roundedRect
        submitInformationDetailTextField.textAlignment = .left
        submitInformationDetailTextField.tag = 0
        
        
        submitImageLabel.text = "添加图片"
        submitImageLabel.textColor = UIColor.black
        submitImageLabel.font = UIFont.systemFont(ofSize: 12)
        submitImageLabel.alpha = 0.5
        submitImageLabel.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(20)
            make.top.equalTo(260)
            make.left.equalTo(15)
        }
        
        submitImageButton.snp.makeConstraints { make in
            make.width.height.equalTo(75)
            make.left.equalTo(15)
            make.top.equalTo(285)
        }
        
        submitImageButton.setImage(imageOfSubmit, for: .normal)
        submitImageButton.addTarget(self, action: #selector(tosubmitImage), for: .touchUpInside)
         
        
        submitPeopleLabel.text = "报修人"
        submitPeopleLabel.textColor = UIColor.black
        submitPeopleLabel.font = UIFont.systemFont(ofSize: 12)
        submitPeopleLabel.alpha = 0.5
        submitPeopleLabel.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(20)
            make.top.equalTo(370)
            make.left.equalTo(15)
        }
        
        
        let attrNameString = NSMutableAttributedString(string: "姓名*", attributes: [NSForegroundColorAttributeName: UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0)])
        let nameRange = NSRange(location: 2, length: 1)
        attrNameString.addAttributes([NSForegroundColorAttributeName: UIColor.red], range: nameRange)
        nameTextField.attributedPlaceholder = attrNameString
        nameTextField.font = UIFont.systemFont(ofSize: 12)
        nameTextField.borderStyle = .roundedRect
        nameTextField.snp.makeConstraints { make in
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(25)
            make.top.equalTo(390)
        }
        nameTextField.tag = 1
        
        
        let attrTelephoneString = NSMutableAttributedString(string: "联系电话*", attributes: [NSForegroundColorAttributeName: UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0)])
        let telephoneRange = NSRange(location: 4, length: 1)
        attrTelephoneString.addAttributes([NSForegroundColorAttributeName: UIColor.red], range: telephoneRange)
        telephoneTextField.attributedPlaceholder = attrTelephoneString
        telephoneTextField.font = UIFont.systemFont(ofSize: 12)
        telephoneTextField.borderStyle = .roundedRect
        telephoneTextField.snp.makeConstraints { make in
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(25)
            make.top.equalTo(425)
        }
        telephoneTextField.tag = 2
        
        submitWarningLabel.text = "*提交后信息不可更改，请仔细检查*"
        submitWarningLabel.textColor = UIColor.red
        submitWarningLabel.font = UIFont.systemFont(ofSize: 12)
        submitWarningLabel.backgroundColor = UIColor.white
        submitWarningLabel.alpha = 0.7
        submitWarningLabel.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.centerX.equalTo(subView)
            make.width.equalTo(200)
            make.top.equalTo(465)
        }
        
        submitButton.setTitle("提交", for: .normal)
        submitButton.backgroundColor = UIColor(red: 254.0 / 255.0, green: 210.0 / 255.0, blue: 44.0 / 255.0, alpha: 1.0)
        submitButton.setTitleColor(UIColor.black, for: .normal)
        submitButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        submitButton.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.centerX.equalTo(subView)
            make.top.equalTo(495)
            make.width.equalTo(80)
        }
        submitButton.layer.cornerRadius = 5
        submitButton.addTarget(self, action: #selector(clickMe), for: .touchUpInside)
        
        self.view.backgroundColor = .white
    }
    
    func clickMe() {
        if buildingTextField.hasText == true && roomTextField.hasText == true && itemTextField.hasText == true && submitInformationDetailTextField.hasText == true && nameTextField.hasText == true && telephoneTextField.hasText == true {
            print("asfc")
            let rvc = OperationDetail()
            rvc.check(submitSituation: true, complaintSituation: false, locationSituation: false)
            self.navigationController?.pushViewController(rvc, animated: true)
        } else {
            print("addad")
            let alert = UIAlertController(title: nil, message: "不要搞事情哦～", preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.6) {
                self.presentedViewController?.dismiss(animated: true, completion: nil)
            }
        }

    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if buildingTextField.inputView == pickerView {
            return buildingOption.count
        } else if roomTextField.inputView == pickerView {
            return roomOption.count
        } else {
            return itemOption.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if buildingTextField.inputView == pickerView {
            return buildingOption[row]
        } else if roomTextField.inputView == pickerView {
            return roomOption[row]
        } else {
            return itemOption[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if buildingTextField.inputView == pickerView {
            buildingTextField.text = buildingOption[row]
        } else if roomTextField.inputView == pickerView {
            roomTextField.text = roomOption[row]
        } else {
            itemTextField.text = itemOption[row]
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //self.subView.frame = self.view.bounds
//        let animationDuration : TimeInterval = 0.3
//        
//        UIView.beginAnimations("ResizeForKeyboard", context: nil)
//        
//        UIView.setAnimationDuration(animationDuration)
//        
//        self.subView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
//        
//        UIView.commitAnimations()
        let animationDuration: TimeInterval = 0.3
        UIView.animate(withDuration: animationDuration) {
            self.subView.frame = self.view.bounds
        }

        self.view.endEditing(true)
    }
//    func keyboardWillShow(sender: NSNotification) {
//        //self.view.frame.origin.y = -230 // Move view 150 points upward
//        subView.frame.origin.y = -self.view.frame.size.height / 4
//    }
//    
//    func keyboardWillHide(sender: NSNotification) {
//        //self.view.frame.origin.y = 0 // Move view to original position
//        subView.frame.origin.y = 0
//    }
//    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField.tag == 0 {
            return true
        }
        
        let animationDuration: TimeInterval = 0.3
        UIView.animate(withDuration: animationDuration) { 
            self.subView.frame = CGRect(x: 0, y: -230, width: self.view.frame.size.width, height: self.view.frame.size.height)
        }
        
//        UIView.beginAnimations("ResizeForKeyboard", context: nil)
//        
//        UIView.setAnimationDuration(animationDuration)
//        
//        self.subView.frame = CGRect(x: 0, y: -230, width: self.view.frame.size.width, height: self.view.frame.size.height)
//       
//        UIView.commitAnimations()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.tag != 0 {
            return true
        }
        
        
        let newLength = (textField.text?.utf16.count)! + string.utf16.count - range.length
//        print("\((textField.text?.utf16.count)!)  \(string.utf16.count)  \(range.length)  \(newLength)")
        return newLength <= 30
        
    }
    
    func tosubmitImage() {
        
        let alertVC = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alertVC.view.tintColor = UIColor.black
        
        let pictureAction = UIAlertAction(title: "从相册中选择图片", style: .default) { _ in
            if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.allowsEditing = true
                imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true) {
                    
                }
            } else {
                let rvc = UIAlertController(title: nil, message: "相册不可用🤒请在设置中打开 BBS 的相册权限", preferredStyle: .alert)
                self.present(rvc, animated: true, completion: nil)
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.6) {
                    self.presentedViewController?.dismiss(animated: true, completion: nil)
                }
            }
        }
        
        let photoAction = UIAlertAction(title: "拍照", style: .default) { _ in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.allowsEditing = true
                imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true) {
                    
                }
            } else {
                let rvc = UIAlertController(title: nil, message: "相机不可用🤒请在设置中打开 BBS 的相机权限", preferredStyle: .alert)
                self.present(rvc, animated: true, completion: nil)
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.6) {
                    self.presentedViewController?.dismiss(animated: true, completion: nil)
                }
            }
        }

        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        
        alertVC.addAction(pictureAction)
        alertVC.addAction(photoAction)
        alertVC.addAction(cancelAction)
        self.present(alertVC, animated: true) {
            
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image: UIImage = info[UIImagePickerControllerEditedImage] as! UIImage
        submitImageButton.setImage(image, for: .normal)
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    
    
}
