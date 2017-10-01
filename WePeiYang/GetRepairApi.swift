//
//  GetRepairApi.swift
//  WePeiYang
//
//  Created by 赵家琛 on 2017/9/23.
//  Copyright © 2017年 twtstudio. All rights reserved.
//

import Foundation
import UIKit

struct GetRepairApi {
    
    static func getRepair(success: @escaping([Article]) -> (), failure: (Error) -> ()) {
        
        SolaSessionManager.solaSession(type: .get, baseURL: "https://open.twtstudio.com", url: "/api/v1/repairs/order/show", token: (TwTUser.shared.token)!, parameters: nil, success: { dic in
            //print(TwTUser.shared.token)
            //print(dic)
            var articles = [Article]()
            if let articlesFromJson = dic["data"] as? [[String : AnyObject]] {
                //print(dic)
                for articleFromJson in articlesFromJson {
                    //print("ssssss")
                    let article = Article()
                    if
                        let id = articleFromJson["id"] as? Int,
                        let detail = articleFromJson["detail"] as? String,
                        let deleted = articleFromJson["deleted"] as? Int,
                        let items = articleFromJson["items"] as? String ,
                        let time = articleFromJson["created_at"] as? String,
                        let state = articleFromJson["state"] as? Int,
                        let complained = articleFromJson["complained"] as? Int
                        //let place = articleFromJson["places"]
                        //complained state
                    {
                        if(complained == 1) {
                            article.situationRepair = "已投诉"
                        } else {
                            if(state == 1) {
                                article.situationRepair = "已接收"
                            } else if(state == 4) {
                                article.situationRepair = "已完成"
                            } else if(state == 0){
                                article.situationRepair = "已上报"
                            } else {
                                article.situationRepair = "已维修"
                            }
                        }
                        
                        
                        article.detailRepair = detail
                        article.itemsRepair = items
                        print(time)
                        let start = time.index(time.startIndex, offsetBy: 10)
                        article.submitTimeRepair = time.substring(to: start)
                        if(deleted == 0) {
                            articles.append(article)
                        }
                    }
                    
                    
                }
                success(articles)
            }
        }, failure: { error in
            
        })
    }
    
    static func getDormitory(success: @escaping (Dictionary<String, Int>) -> (), failure: (Error) -> ()) {
        SolaSessionManager.solaSession(type: .get, baseURL: "https://open.twtstudio.com", url: "/api/v1/repairs/area", parameters: nil, success: { dic in
            //print(TwTUser.shared.token)
            //print(dic)
            var listDormitory: Dictionary<String, Int> = [:]
            
            
            if let articlesFromJson = dic["data"] as? [[String : AnyObject]] {
                print(dic)
                for articleFromJson in articlesFromJson {
                    //print("ssssss")
                    if
                        let id = articleFromJson["id"] as? Int,
                        let area_name = articleFromJson["area_name"] as? String {
                        listDormitory[area_name] = id
                    }
                }
                success(listDormitory)
            }
        }, failure: { error in
            
        })
    }
    
    
}
