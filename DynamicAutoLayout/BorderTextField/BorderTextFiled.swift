//
//  BorderTextFiled.swift
//  IQMobile
//
//  Created by User on 24/11/2015.
//  Copyright © 2015 Sigmatec. All rights reserved.
//

import UIKit

class BorderTextFiled: UITextField {

    let borderColor     : CGFloat = 220/255.0
    let borderBgColor   : CGFloat = 245/255.0
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        
        if self.textAlignment == NSTextAlignment.right {
            
            self.layer.sublayerTransform = CATransform3DMakeTranslation(-5, 0, 0);
            
        }else {
            
            self.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0);
        }
        
        self.font                   = UIFont.systemFont(ofSize: 14)
        self.clipsToBounds          = true
        self.layer.cornerRadius     = 4
        self.layer.borderWidth      = 1.0
        self.layer.borderColor      = UIColor(red: borderColor, green: borderColor, blue: borderColor, alpha: 1.0).cgColor
        self.backgroundColor        = UIColor(red: borderBgColor, green: borderBgColor, blue: borderBgColor, alpha: 1.0)
        self.textColor              = UIColor(red: 122/255, green: 122/255, blue: 122/255, alpha: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
       
    }
        
//    override func canPerformAction(action: Selector, withSender sender: AnyObject?) -> Bool {
//        // Disable copy, select all, paste
//        if action == Selector("paste:") {
//            return false
//        }
//        // Default
//        return super.canPerformAction(action, withSender: sender)
//    }
}
