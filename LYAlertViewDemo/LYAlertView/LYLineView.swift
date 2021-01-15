//
//  LYLineView.swift
//  LYAlertViewDemo
//
//  Created by DisCover on 2021/1/12.
//

import UIKit

public enum LYLineType {
    case bottom
    case left
}

class LYLineView: CALayer {


    
    init(_ lineWidth:CGFloat,_ color:UIColor ,_ type:LYLineType,_ superView:UIView){
        super.init()
        switch type {
        case .left:
            self.frame = CGRect(x: LYCommonSet.Awidth/2.0 - lineWidth ,y: 0, width: lineWidth, height: superView.frame.height)
        default:
            self.frame =  CGRect(x: 0,y: superView.frame.height - lineWidth, width: superView.frame.width, height: lineWidth)

        }
        self.backgroundColor = color.cgColor
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
