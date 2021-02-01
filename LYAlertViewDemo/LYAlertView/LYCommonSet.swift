//
//  LYCommonSet.swift
//  LYAlertViewDemo
//
//  Created by DisCover on 2021/1/4.
//  Copyright © 2021 ly. All rights reserved.
//

import UIKit

public enum LYCommonSet {
    //弹框默认宽度
    static let Awidth:CGFloat = 270.0
    //标题默认 size
    static let titleSize =  CGRect(x: 0, y: 0, width: Awidth, height: 50)
    
    //标题默认字体大小
    static let titleFont:CGFloat = 17.0
    //按钮间隔
    static let buttonMarin:CGFloat = 15
    //field间隔
    static let fieldMarin:CGFloat = 30
    
    //响应 item 的高度
    static var InteractiveItemHeight:CGFloat = 74
    //按钮的高度
    static let buttonHeight:CGFloat = 44
    //屏宽
    static let Kwidth = UIScreen.main.bounds.size.width
    //屏高
    static let Kheith = UIScreen.main.bounds.size.height
    static let  alertDefaultBackgroundColor = LYCommonSet.RGBA(r: 240, g: 240, b: 240, a: 1)
    //RGB
    static func RGBA (r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat)->UIColor { return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a) }

    
    public typealias btnClosure = ()->()
    //主屏幕
    static func keyWindows()->UIWindow?{
        if #available(iOS 13.0, *) {
            let arr = Array(UIApplication.shared.connectedScenes)
            let scene:UIWindowScene =   arr.first as! UIWindowScene
            let keyWindow =   scene.windows[0]
            return keyWindow

        }else{
            return UIApplication.shared.keyWindow
        }

    }
}
