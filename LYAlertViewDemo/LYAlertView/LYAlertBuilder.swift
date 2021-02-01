//
//  LYAlertBuilder.swift
//  LYAlertViewDemo
//
//  Created by DisCover on 2021/1/4.
//  Copyright © 2021 ly. All rights reserved.
//

import UIKit


public class LYAlertBuilder {
    var alertView:LYAlertShowView?
    public init(_ title:(UIView&LYAlertItemProtocol)?,_ content:UIView&LYAlertItemProtocol,_ buttons:[UIView&LYAlertInteractiveItemProtocol]) {
         alertView = LYAlertShowView.init(title, content, buttons)
     }
    
    public  func borderColor(_ color:UIColor) -> Self {
        self.alertView?.alertView.layer.borderColor = color.cgColor
        return self
    }
    public func borderWidth(_ width:CGFloat) -> Self {
        self.alertView?.alertView.layer.borderWidth = width
        return self
    }
    public   func cornerRadius(_ radius:CGFloat) -> Self {
        self.alertView?.alertView.layer.cornerRadius = radius
        return self
    }
    public  func shadowPath(_ path:CGPath) -> Self {
        self.alertView?.alertView.layer.shadowPath = path
        return self
    }
    public  func shadowOffset(_ size:CGSize) -> Self {
        self.alertView?.alertView.layer.shadowOffset = size
        return self
    }
    public  func shadowRadius(_ radius:CGFloat) -> Self {
        self.alertView?.alertView.layer.shadowRadius = radius
        return self
    }
    public  func shadowOpacity(_ opacity:Float) -> Self {
        self.alertView?.alertView.layer.shadowOpacity = opacity
        return self
    }
    public  func shadowColor(_ color:UIColor) -> Self {
        self.alertView?.alertView.layer.shadowColor = color.cgColor
        return self
    }
    public func maskAlpha(_ alpha:CGFloat) -> Self {
        self.alertView?.blackView.backgroundColor = LYCommonSet.RGBA(r: 0, g: 0, b: 0, a: alpha)
        return self
    }
    public func tapMaskHide(_ isHide:Bool) -> Self {
        self.alertView?.isHide = isHide
        return self
    }
    public  func showAnimation(_ type:LYAlertAnimationPopType,_ during:CFTimeInterval)->Self{
        self.alertView?.showType = type
        self.alertView?.showDuring = during
        return self
    }
    public func hideAnimation(_ type:LYAlertAnimationDissType,_ during:CFTimeInterval)->Self{
        self.alertView?.hideType = type
        self.alertView?.hideDuring = during
        return self
    }
    
    public func build()-> LYAlertShowView?{
       return alertView
    }
    
}

