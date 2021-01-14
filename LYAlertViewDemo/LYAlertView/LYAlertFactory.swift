////
////  LYAlertFactory.swift
//// LYAlertViewDemo
////
////  Created by DisCover on 2020/12/17.
////  Copyright © 2020 ly. All rights reserved.
////
//
import Foundation
import UIKit
//具体工厂类
class  LYAlertFactory:LYAlertFactoryProtocol{
    //创建展示 item
    func creatAlertShowItem(_ type: LYAlertTitleItemType, _ text: String) -> LYAlertTitleShowProtocol {
     return LYAlertTitleItem.init(type, text: text)
    }
    //创建交互 item
    func creatAlertInteractiveItem(_ text: String) -> LYAlertInteractiveItemProtocol {
        return LYAlertInteractiveItem.init(text)
   
    }
}
