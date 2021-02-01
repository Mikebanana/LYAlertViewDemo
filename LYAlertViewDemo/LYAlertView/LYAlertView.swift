//
//  LYAlertView.swift
//  LYAlertViewDemo
//
//  Created by DisCover on 2021/1/6.
//

import UIKit

class LYAlertView: UIView {
    var title:(UIView&LYAlertItemProtocol)?
    
    var content:(UIView&LYAlertItemProtocol)?

    var buttons:[LYAlertInteractiveItem]?
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = true
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoard(not:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func keyBoard(not:Notification){
        
        let duration = not.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval

        let endFrame = (not.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue

        let keyboardHeight = endFrame.origin.y
        let margin = LYCommonSet.Kheith - keyboardHeight

        if margin != 0{
            
         let offsetY =   self.frame.origin.y  -  (LYCommonSet.Kheith - margin - self.frame.height)
            
            UIView.animate(withDuration: duration) {
                self.transform = CGAffineTransform.init(translationX: 0, y: -offsetY)
            }
            
        }else{
            UIView.animate(withDuration: duration) {
                self.transform = CGAffineTransform.identity
            }
        }

        
    }
    convenience init(_ title:(UIView&LYAlertItemProtocol)?,_ content:UIView&LYAlertItemProtocol,_ buttons:[LYAlertInteractiveItem]){
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
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)

    }

}
