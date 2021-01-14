//
//  StringExtension.swift
//  LYAlertViewDemo
//
//  Created by DisCover on 2021/1/4.
//  Copyright © 2021 ly. All rights reserved.
//

import UIKit

extension String{
    func returnRect(font:CGFloat,width:CGFloat)->CGRect{
        return (self as NSString).boundingRect(with: CGSize(width: width, height: 1000), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: font)], context: nil)
    }
   
}
extension NSAttributedString{
    func returnAttRect(width:CGFloat)->CGRect{
        return self.boundingRect(with: CGSize(width: width, height: 1000), options: .usesLineFragmentOrigin, context: nil)
    }
}
