////
////  LYAlertInteractiveItem.swift
////  LYAlertViewDemo
////
////  Created by DisCover on 2020/12/18.
////  Copyright © 2020 ly. All rights reserved.
////

import UIKit

class LYAlertInteractiveItem: UIView,LYAlertInteractiveItemProtocol {
    func titleColor(_ color: UIColor) -> Self {
        button.setTitleColor(color, for: .normal)
        return self
    }
    func btnBackgroundColor(_ color:UIColor) -> Self{
        button.backgroundColor = color
        return self

    }
    func itemBackgroundColor(_ color:UIColor) -> Self{
        self.backgroundColor = color
        return self
    }
    func btnRadius(_ radius:CGFloat) -> Self{
        button.layer.cornerRadius = radius
        return self
    }
    func btnBorderWidth(_ borderWidth:CGFloat) -> Self{
        button.layer.borderWidth =  borderWidth
        return self
    }
    func btnBorderColor(_ color:UIColor) -> Self{
        button.layer.borderColor = color.cgColor
        return self
    }

    func fontSize(_ font: CGFloat) -> Self {
        button.titleLabel?.font = UIFont.systemFont(ofSize: font)
        return self
    }
    func line(_ color:UIColor,_ width:CGFloat,_ type:LYLineType) -> Self{
        let line  = LYLineView.init(width, color, type, self)
        layer.addSublayer(line)
        return self
    }
    func btnHeight(_ height:CGFloat)->Self{
        self.buttonHeigth = height
        LYCommonSet.InteractiveItemHeight = buttonHeigth + buttonMarin*2

        self.frame = CGRect(x: 0, y: 0, width: LYCommonSet.Awidth, height: LYCommonSet.InteractiveItemHeight)
        return self
    }
    func btnMarin(_ marin:CGFloat)->Self{
        self.buttonMarin = marin
        LYCommonSet.InteractiveItemHeight = buttonHeigth + buttonMarin*2

        self.frame = CGRect(x: 0, y: 0, width: LYCommonSet.Awidth, height: LYCommonSet.InteractiveItemHeight)
        return self
    }
    func attribute(_ attribute:[NSAttributedString.Key :Any])->Self{
        let aString = NSAttributedString(string: text, attributes: attribute)
        self.button.setAttributedTitle(aString, for: .normal)
        return self
    }
    
    @discardableResult
    func action(clo:@escaping LYCommonSet.btnClosure) -> Self {
        
        self.closure = { [weak self] in
            clo()
            if let hide =  self?.hideClosure{
                hide()
            }
        }
      
        return self
    }
    
    private var button = UIButton()
    private var text = ""
    public var closure:LYCommonSet.btnClosure?
    public var hideClosure:LYCommonSet.btnClosure?
    private var buttonHeigth :CGFloat = LYCommonSet.buttonHeight
    private var buttonMarin:CGFloat = LYCommonSet.buttonMarin

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        button.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        addSubview(button)
    }
    convenience init(_ text:String){
        
        self.init(frame: CGRect(x: 0, y: 0, width: LYCommonSet.Awidth, height:LYCommonSet.InteractiveItemHeight))
        self.text = text
        button.setTitle(text, for: .normal)

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
            self.button.frame = CGRect(x: self.buttonMarin, y: self.buttonMarin, width: self.frame.width - 2*self.buttonMarin, height: self.buttonHeigth)


    }
    
      @objc private func  btnClick(){
        if let clo = closure{
            clo()
        }
    }
    
 
}
