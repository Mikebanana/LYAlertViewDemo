//
//  File.swift
//  LYAlertViewDemo
//
//  Created by DisCover on 2020/12/17.
//  Copyright © 2020 ly. All rights reserved.
//

import Foundation
import UIKit
public protocol LYAlertFactoryProtocol {
    func creatAlertShowItem(_ type:LYAlertTitleItemType, _ text:String) -> UIView&LYAlertTitleShowProtocol
    func creatAlertInteractiveItem(_ text: String)->UIView&LYAlertInteractiveItemProtocol
    func creatAlertFieldItem(_ placeholder: String)->UIView&LYAlertTextFieldProtocol

}

public protocol LYAlertItemProtocol{
    func titleColor(_ color:UIColor) -> Self
    func fontSize(_ font:CGFloat) -> Self
    func line(_ color:UIColor,_ width:CGFloat) -> Self

    func attribute(_ attribute:[NSAttributedString.Key :Any])->Self
}

extension LYAlertItemProtocol{
    func attribute(_ attribute:[NSAttributedString.Key :Any])->Self{
        return self
    }
    func line(_ color:UIColor,_ width:CGFloat) -> Self{
        return self
    }

}

public protocol LYAlertTextFieldProtocol:LYAlertItemProtocol {
    func borderStyle(_ style:UITextField.BorderStyle)->Self
    func attributedPlaceholder(_ str:NSAttributedString)->Self
    func clearsOnBeginEditing(_ clear:Bool)->Self
    func delegate(_ delegate:UIResponder)->Self
    func keyboardType(_ type:UIKeyboardType)->Self
    
    
    
}


public protocol LYAlertTitleShowProtocol:LYAlertItemProtocol {
    func textAlignment(_ alignment:NSTextAlignment) -> Self
}
public protocol LYAlertInteractiveItemProtocol:LYAlertItemProtocol  {
    func btnBackgroundColor(_ color:UIColor) -> Self
    func itemBackgroundColor(_ color:UIColor) -> Self
    func btnRadius(_ radius:CGFloat) -> Self
    func btnBorderWidth(_ borderWidth:CGFloat) -> Self
    func btnBorderColor(_ color:UIColor) -> Self
    func line(_ color:UIColor,_ width:CGFloat,_ type:LYLineType) -> Self
    func btnHeight(_ height:CGFloat)->Self
    func btnMarin(_ marin:CGFloat)->Self

    func action(clo:@escaping LYCommonSet.btnClosure)  -> Self
}
