//
//  LYAlertShowView.swift
//  LYAlertViewDemo
//
//  Created by DisCover on 2021/1/11.
//

import UIKit

class LYAlertShowView: UIView {
    var title:LYAlertTitleItem?
    
    var content:LYAlertTitleItem?
    
    var buttons:[LYAlertInteractiveItem]?
    
    var animation:LYAlertAnimation?
    
    var showType:LYAlertAnimationPopType = .default
    var hideType:LYAlertAnimationDissType = .default
    var showDuring:CFTimeInterval = 0.2
    var hideDuring:CFTimeInterval = 0.2

   lazy var blackView:UIView = {
    let blackView = UIView(frame: UIScreen.main.bounds)
    blackView.alpha = 0
    blackView.backgroundColor = LYCommonSet.RGBA(r: 0, g: 0, b: 0, a: 0.2)
    
    return blackView

    }()
    lazy var alertView : LYAlertView = {
        let alertView = LYAlertView.init(self.title, self.content!, self.buttons!)
        alertView.backgroundColor = LYCommonSet.alertDefaultBackgroundColor
        alertView.alpha = 0
        return alertView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.animation = LYAlertAnimation()
     
    }
    convenience init(_ title:LYAlertTitleShowProtocol?,_ content:LYAlertTitleShowProtocol,_ buttons:[LYAlertInteractiveItemProtocol]){
        self.init(frame: UIScreen.main.bounds)
        self.title  = title as? LYAlertTitleItem
        self.content = content as? LYAlertTitleItem
        self.buttons = buttons as? [LYAlertInteractiveItem]
        if let b = self.buttons{
            for btn in b{
                btn.hideClosure = {[weak self] in
                    self?.hide()
                }
            }
        }
        addSubview(blackView)
        addSubview(alertView)


        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    
    public  func show(){
        
        LYCommonSet.keyWindows()?.addSubview(self)
        
        self.animation?.show(self.showType, showDuring, self.alertView)

        UIView.animate(withDuration: showDuring, animations: {
            self.blackView.alpha = 1
        }) { (isCom) in
        }
    }
    
    
    public func hide(){
        self.animation?.hide(hideType, hideDuring, self.alertView)

        UIView.animate(withDuration: hideDuring, animations: {
            self.blackView.alpha = 0
        }) { (isCom) in
            self.removeFromSuperview()
        }
        
    }
    
    
    
  
}
