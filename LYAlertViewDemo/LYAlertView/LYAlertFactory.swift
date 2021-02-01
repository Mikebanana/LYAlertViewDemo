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
public class  LYAlertFactory:LYAlertFactoryProtocol{
    public init() {}
    //创建展示 item
    public func creatAlertShowItem(_ type: LYAlertTitleItemType, _ text: String) -> UIView&LYAlertTitleShowProtocol {
     return LYAlertTitleItem.init(type, text: text)
    }
    //创建交互 item
    public func creatAlertInteractiveItem(_ text: String) -> UIView&LYAlertInteractiveItemProtocol {
        return LYAlertInteractiveItem.init(text)
    }
    //创建输入 item
    public func creatAlertFieldItem(_ placeholder: String)->UIView&LYAlertTextFieldProtocol{
        return LYAlertTextFieldItem.init(placeholder)
    }

    
}
