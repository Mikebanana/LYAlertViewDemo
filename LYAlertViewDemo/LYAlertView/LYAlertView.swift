//
//  LYAlertView.swift
//  LYAlertViewDemo
//
//  Created by DisCover on 2021/1/6.
//

import UIKit

class LYAlertView: UIView {
    var title:LYAlertTitleItem?
    
    var content:LYAlertTitleItem?
    
    var buttons:[LYAlertInteractiveItem]?
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(_ title:LYAlertTitleItem?,_ content:LYAlertTitleItem,_ buttons:[LYAlertInteractiveItem]){
        self.init(frame: CGRect.zero)
        self.title = title
        self.content = content
        self.buttons = buttons
        if title != nil{
            self.addSubview(title!)
        }
       
        self.addSubview(content)
        for btn in buttons{
            self.addSubview(btn)
        }
        var alertHeight:CGFloat = 0
        if buttons.count == 2{
            alertHeight = (title?.frame.height ?? 0) + content.frame.height + LYCommonSet.InteractiveItemHeight
        }else{
            alertHeight = (title?.frame.height ?? 0) + content.frame.height + CGFloat(buttons.count) * LYCommonSet.InteractiveItemHeight
        }
        self.frame = CGRect(x: (LYCommonSet.Kwidth - LYCommonSet.Awidth)/2.0, y: (LYCommonSet.Kheith - alertHeight)/2.0, width: LYCommonSet.Awidth, height: alertHeight)

        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let c = content,let b = buttons{
            c.frame = CGRect(x: 0, y: title?.frame.maxY ?? 0, width: c.frame.width, height: c.frame.height)

        if b.count == 2{
            for(i,btn) in b.enumerated(){
                btn.frame = CGRect(x: CGFloat(i)*(self.frame.width/2), y: c.frame.maxY, width: self.frame.width/2, height: LYCommonSet.InteractiveItemHeight)
            }
        }else{
            for(i,btn) in b.enumerated(){
                btn.frame = CGRect(x: 0, y: c.frame.maxY + CGFloat(i)*LYCommonSet.InteractiveItemHeight, width: self.frame.width, height: LYCommonSet.InteractiveItemHeight)
            }
        }
        }
        
    }
    

}
