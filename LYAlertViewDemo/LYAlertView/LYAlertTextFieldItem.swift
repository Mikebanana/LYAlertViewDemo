//
//  LYAlertTextFieldItem.swift
//  LYAlertViewDemo
//
//  Created by DisCover on 2021/1/28.
//

import UIKit

class LYAlertTextFieldItem: UIView,LYAlertTextFieldProtocol {
    func delegate(_ delegate: UIResponder) -> Self {
        self.textField.delegate = delegate as? UITextFieldDelegate
        return self
    }
    
    
    func borderStyle(_ style: UITextField.BorderStyle) -> Self {
        self.textField.borderStyle = style
        return self
    }
    
    func attributedPlaceholder(_ str: NSAttributedString) -> Self {
        self.textField.attributedPlaceholder = str
        return self
    }
    
    func clearsOnBeginEditing(_ clear: Bool) -> Self {
        self.textField.clearsOnBeginEditing = clear
        return self
    }
    
    func titleColor(_ color: UIColor) -> Self {
        self.textField.textColor = color
        return self
    }
    
    func fontSize(_ font: CGFloat) -> Self {
        self.textField.font = UIFont.systemFont(ofSize: font)
        return self
    }
    func line(_ color:UIColor,_ width:CGFloat) -> Self{
        let line = LYLineView.init(width, color, .bottom, self)
        layer.addSublayer(line)
        return self
    }
    func keyboardType(_ type:UIKeyboardType)->Self{
        self.textField.keyboardType = type
        return self
    }
    
    var textField = UITextField()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(textField)

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(_ placeholder:String){
        
        self.init(frame:CGRect(x: 0, y: 0, width: LYCommonSet.Awidth, height: LYCommonSet.titleSize.height + 2 * LYCommonSet.buttonMarin))
        self.textField.placeholder = placeholder
        
        
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.textField.frame = CGRect(x: LYCommonSet.buttonMarin, y: 2*LYCommonSet.buttonMarin, width: LYCommonSet.Awidth - 2*(LYCommonSet.buttonMarin), height: self.frame.height - 4*(LYCommonSet.buttonMarin))
    }
    
}

