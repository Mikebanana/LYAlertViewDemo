//
//  LYAlertBuilder.swift
//  LYAlertViewDemo
//
//  Created by DisCover on 2021/1/4.
//  Copyright © 2021 ly. All rights reserved.
//

import UIKit


class LYAlertBuilder {
    var alertView:LYAlertShowView?
    
    init(_ title:LYAlertTitleShowProtocol?,_ content:LYAlertTitleShowProtocol,_ buttons:[LYAlertInteractiveItemProtocol]) {
        alertView = LYAlertShowView.init(title, content, buttons)
    }
    
    func borderColor(_ color:UIColor) -> Self {
        self.alertView?.alertView.layer.borderColor = color.cgColor
        return self
    }
    func borderWidth(_ width:CGFloat) -> Self {
        self.alertView?.alertView.layer.borderWidth = width
        return self
    }
    func cornerRadius(_ radius:CGFloat) -> Self {
        self.alertView?.alertView.layer.cornerRadius = radius
        return self
    }
    func shadowPath(_ path:CGPath) -> Self {
        self.alertView?.alertView.layer.shadowPath = path
        return self
    }
    func shadowOffset(_ size:CGSize) -> Self {
        self.alertView?.alertView.layer.shadowOffset = size
        return self
    }
    func shadowRadius(_ radius:CGFloat) -> Self {
        self.alertView?.alertView.layer.shadowRadius = radius
        return self
    }
    func shadowOpacity(_ opacity:Float) -> Self {
        self.alertView?.alertView.layer.shadowOpacity = opacity
        return self
    }
    func shadowColor(_ color:UIColor) -> Self {
        self.alertView?.alertView.layer.shadowColor = color.cgColor
        return self
    }
    func maskAlpha(_ alpha:CGFloat) -> Self {
        self.alertView?.blackView.backgroundColor = LYCommonSet.RGBA(r: 0, g: 0, b: 0, a: alpha)
        return self
    }
    func showAnimation(_ type:LYAlertAnimationPopType,_ during:CFTimeInterval)->Self{
        self.alertView?.showType = type
        self.alertView?.showDuring = during
        return self
    }
    func hideAnimation(_ type:LYAlertAnimationDissType,_ during:CFTimeInterval)->Self{
        self.alertView?.hideType = type
        self.alertView?.hideDuring = during
        return self
    }
    
    func build()-> LYAlertShowView?{
       return alertView
    }
    
}

