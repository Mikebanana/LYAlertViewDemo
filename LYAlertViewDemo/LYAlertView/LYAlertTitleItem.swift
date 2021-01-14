//
//  LYAlertTitleItem.swift
//  LYAlertViewDemo
//
//  Created by DisCover on 2020/12/17.
//  Copyright © 2020 ly. All rights reserved.
//

import UIKit

enum LYAlertTitleItemType {
    case title
    case content
}

class LYAlertTitleItem: UIView,LYAlertTitleShowProtocol  {
 

    func fontSize(_ font:CGFloat) -> Self {
        self.font = font
        self.label.font = UIFont.systemFont(ofSize: font)
        return self
    }
    func titleColor(_ color:UIColor) -> Self {
        self.label.textColor = color
        return self
    }
    func textAlignment(_ alignment:NSTextAlignment) -> Self {
        self.label.textAlignment = alignment
        return self
    }
    
    func line(_ color:UIColor,_ width:CGFloat) -> Self{
        let line = LYLineView.init(width, color, .bottom, self)
        layer.addSublayer(line)
        return self
    }
    func attribute(_ attribute:[NSAttributedString.Key :Any])->Self{
        let aString = NSAttributedString(string: text, attributes: attribute)
        self.label.attributedText = aString
        let rect =  aString.returnAttRect(width: LYCommonSet.Awidth - 2.0*LYCommonSet.buttonMarin)
        self.frame = CGRect(x: 0, y: 0, width: LYCommonSet.Awidth, height: rect.height + 3.0 * LYCommonSet.buttonMarin)
        return self
    }
    
    private var label = UILabel()
    private var type:LYAlertTitleItemType = .title
    private var text = ""
    private var font:CGFloat = LYCommonSet.titleFont{
        didSet{
            switch type {
            case .title:
                self.frame = LYCommonSet.titleSize
            case .content:
                let rect = text.returnRect(font: font, width: LYCommonSet.Awidth - 2.0*LYCommonSet.buttonMarin)
                self.frame = CGRect(x: 0, y: 0, width: LYCommonSet.Awidth, height: rect.height + 3.0 * LYCommonSet.buttonMarin)
                    
            }

        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        label.textAlignment = .center
        label.numberOfLines = 0
        
        addSubview(label)
        
    }
    convenience init(_ type:LYAlertTitleItemType,text:String){
        
        self.init(frame: .zero)
        self.type = type
        self.text = text
        self.font = LYCommonSet.titleFont
        label.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        superview?.layoutSubviews()
        label.frame = CGRect(x: LYCommonSet.buttonMarin, y: LYCommonSet.buttonMarin, width: frame.width - 2.0*LYCommonSet.buttonMarin, height: frame.height - 2.0*LYCommonSet.buttonMarin)

    }
    

}
