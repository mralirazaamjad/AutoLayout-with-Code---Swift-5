//
//  ViewController.swift
//  DynamicAutoLayout
//
//  Created by User on 28/03/2016.
//  Copyright © 2016 SigmaTec. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var _lastView       : UIView!
    let borderColor     : CGFloat = 220/255.0
    let borderBgColor   : CGFloat = 245/255.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        _lastView = self.addNewView(lastView: nil, isTextView: false)
        
        //Add UILabel or UITextField
        self.addLabelAndTextField(newView: _lastView, lastView: nil)
        
        //Add button
        self.addLabelAndButton(newView: self.addNewView(lastView: _lastView, isTextView: false), lastView: _lastView)
        
        //Add TextView
        self.addLabelAndTextView(newView: self.addNewView(lastView: _lastView, isTextView: true), lastView: _lastView)
        
        //Add UILabel or UITextField
        self.addLabelAndTextField(newView: self.addNewView(lastView: _lastView, isTextView: false), lastView: _lastView)
        
        //Add button
        self.addLabelAndButton(newView: self.addNewView(lastView: _lastView, isTextView: false), lastView: _lastView)
        
        //Add Check Boxes
        self.creationOfCheckBoxes()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func addNewView (lastView: UIView!, isTextView: Bool) -> UIView{
        
        //UIView
        let newView = UIView()
//        newView.backgroundColor = UIColor.purpleColor()
        newView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(newView)
        
        if lastView == nil {
            
            let topConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 30)
            self.view.addConstraint(topConstraint)
            
        }
        
        var height = 31
        if isTextView {
            
            height = 100
        }
        
        
        let leadingConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 20)
        self.view.addConstraint(leadingConstraint)
        
        let trailingConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: -20)
        self.view.addConstraint(trailingConstraint)
        
        let heightConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: CGFloat(height))
        self.view.addConstraint(heightConstraint)
        
        return newView
    }
    
    func addLabelAndTextField (newView: UIView, lastView: UIView!) {
        
        if lastView != nil {
            
            let views = ["lastView": lastView,
                "newView": newView]
            
            let VSpacingConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[lastView]-10-[newView]", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: views)
            self.view.addConstraints(VSpacingConstraints)
        }
        
        //UILabel
        let newLabel = self.returnLabel(newView: newView, bottomConstant: 0)
        
        newLabel.text = "Hello World:"
        
        //UITextField
        let newTextField = BorderTextFiled()
        newTextField.translatesAutoresizingMaskIntoConstraints = false
        newView.addSubview(newTextField)
        
        let topFieldConstraint = NSLayoutConstraint(item: newTextField, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: newView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 0)
        newView.addConstraint(topFieldConstraint)
        
        let bottomFieldConstraint = NSLayoutConstraint(item: newTextField, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: newView, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 0)
        newView.addConstraint(bottomFieldConstraint)
        
        
        let horozontalConstraint = NSLayoutConstraint(item: newTextField, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: newLabel, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1, constant: 10)
        newView.addConstraint(horozontalConstraint)
        
        let trailingFieldConstraint = NSLayoutConstraint(item: newTextField, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: newView, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: -20)
        newView.addConstraint(trailingFieldConstraint)
        
        _lastView = newView
    }
    
    func addLabelAndButton (newView: UIView, lastView: UIView!) {
        
        if lastView != nil {
            
            let views = ["lastView": lastView,
                         "newView": newView]
            
            let VSpacingConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[lastView]-10-[newView]", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: views)
            self.view.addConstraints(VSpacingConstraints)
        }
        //UILabel
        let newLabel = self.returnLabel(newView: newView, bottomConstant: 0)
        
        newLabel.text = "New Button:"
        
        //UITextField
        let newButton = UIButton()
        newButton.translatesAutoresizingMaskIntoConstraints = false
        newView.addSubview(newButton)
        
        
        let topFieldConstraint = NSLayoutConstraint(item: newButton, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: newView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 0)
        newView.addConstraint(topFieldConstraint)
        
        let bottomFieldConstraint = NSLayoutConstraint(item: newButton, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: newView, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 0)
        newView.addConstraint(bottomFieldConstraint)
        
        
        let horozontalConstraint = NSLayoutConstraint(item: newButton, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: newLabel, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1, constant: 10)
        newView.addConstraint(horozontalConstraint)
        
        let trailingFieldConstraint = NSLayoutConstraint(item: newButton, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: newView, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: -20)
        newView.addConstraint(trailingFieldConstraint)
        
        ///
        newButton.clipsToBounds          = true
        newButton.layer.cornerRadius     = 6
        newButton.layer.borderWidth      = 1.0
        newButton.layer.borderColor      = UIColor(red: borderColor, green: borderColor, blue: borderColor, alpha: 1.0).cgColor
        newButton.backgroundColor        = UIColor(red: borderBgColor, green: borderBgColor, blue: borderBgColor, alpha: 1.0)
        newButton.titleLabel!.font       =  UIFont.systemFont(ofSize: 14)
        newButton.setTitle("  Select...", for: .normal)
        newButton.setTitleColor(UIColor.black, for: .normal)
        newButton.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        newButton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        
        _lastView = newView
    }
    
    func addLabelAndTextView (newView: UIView, lastView: UIView!) {
        
        if lastView != nil {
            
            let views = ["lastView": lastView,
                "newView": newView]
            
            let VSpacingConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[lastView]-10-[newView]", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: views)
            self.view.addConstraints(VSpacingConstraints)
            
        }
        //UILabel
        let newLabel = self.returnLabel(newView: newView, bottomConstant : -75)
        
        newLabel.text = "New TextView:"
        
        //UITextField
        let newTextView = BorderTextView()
        
        newTextView.translatesAutoresizingMaskIntoConstraints = false
        newView.addSubview(newTextView)
        
        let topFieldConstraint = NSLayoutConstraint(item: newTextView, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: newView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 0)
        newView.addConstraint(topFieldConstraint)
        
        let bottomFieldConstraint = NSLayoutConstraint(item: newTextView, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: newView, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 0)
        newView.addConstraint(bottomFieldConstraint)
        
        
        let horozontalConstraint = NSLayoutConstraint(item: newTextView, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: newLabel, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1, constant: 10)
        newView.addConstraint(horozontalConstraint)
        
        let trailingFieldConstraint = NSLayoutConstraint(item: newTextView, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: newView, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: -20)
        newView.addConstraint(trailingFieldConstraint)
        
//        //HTML String
//        let attrStr = try! NSAttributedString(
//            data: "Waiting (Internal) status changed to In Progress by Keller, K. <br/> <b>Comments: </b> Ghhg".data(using: String.Encoding.unicode, allowLossyConversion: true)!,
//            options: [ NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html],
//            documentAttributes: nil)
//
//        newTextView.attributedText = attrStr
        
        _lastView = newView
    }
    
    //Check Boxes
    func creationOfCheckBoxes () {
        
        let divisor : CGFloat  = 5
        var quantity : CGFloat = 1
        var lineOfbutton  = Int(quantity / divisor)
        let linesOfButtons : CGFloat = quantity / divisor
        
        if CGFloat(lineOfbutton) < linesOfButtons {
            
            lineOfbutton += 1
        }
        
        for i in 0 ..< lineOfbutton {
            
            let newView = self.addNewView(lastView: _lastView, isTextView: false)
            //UILabel
            let newLabel = self.returnLabel(newView: newView, bottomConstant :0)
            
            if i > 0 {
                
                newLabel.text = ""
                
            }else {
                
                newLabel.text = "Check boxes:"
            }
            
            if quantity >= 5 {
                
                self.addLabelAndCheckBoxes(newView: newView, lastView: _lastView, quantiy: 5, newLabel: newLabel)
                
            }else {
                
                self.addLabelAndCheckBoxes(newView: newView, lastView: _lastView, quantiy: Int(quantity), newLabel: newLabel)
            }
            
            quantity = quantity - 5
            
        }
    }
    
    func addLabelAndCheckBoxes (newView: UIView, lastView: UIView!, quantiy: Int, newLabel: UILabel) {
        
        if lastView != nil {
            
            //vertical distance between two views
            let views = ["lastView": lastView,
                "newView": newView]
            
            let VSpacingConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[lastView]-10-[newView]", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: views)
            self.view.addConstraints(VSpacingConstraints)
        }
        
        
        var previousView : AnyObject!
        previousView = newLabel
        
        var width : CGFloat = 0
        
        //UIButtonssss
        for i in 0 ..< quantiy {
        
            let newButton = UIButton()
            newButton.translatesAutoresizingMaskIntoConstraints = false
            newView.addSubview(newButton)
            
            let topFieldConstraint = NSLayoutConstraint(item: newButton, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: previousView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 0)
            newView.addConstraint(topFieldConstraint)
            
            let bottomFieldConstraint = NSLayoutConstraint(item: newButton, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: previousView, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 0)
            newView.addConstraint(bottomFieldConstraint)
            
            
            let horozontalConstraint = NSLayoutConstraint(item: newButton, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: previousView, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1, constant: 10)
            newView.addConstraint(horozontalConstraint)
            
            ///
            newButton.setImage(UIImage(named: "checkbox_unselect"), for: UIControl.State())
            newButton.setImage(UIImage(named: "checkbox_select"), for: UIControl.State.selected)
            
            ///
            newButton.titleLabel!.font =  UIFont.systemFont(ofSize: 14)
            newButton.setTitle("  Check Box \(i)", for: .normal)
            newButton.setTitleColor(UIColor.orange, for: .normal)
            //
            previousView = newButton
            
        }
        
        ////
        _lastView = newView
    }
    
    func returnLabel (newView: UIView, bottomConstant: CGFloat) -> UILabel {
        
        let newLabel = UILabel()
        newLabel.font = UIFont.systemFont(ofSize: 14)
        newLabel.translatesAutoresizingMaskIntoConstraints = false
        newView.addSubview(newLabel)
        
        let topLabelConstraint = NSLayoutConstraint(item: newLabel, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: newView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 0)
        newView.addConstraint(topLabelConstraint)
        
        let bottomLabelConstraint = NSLayoutConstraint(item: newLabel, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: newView, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: bottomConstant)
        newView.addConstraint(bottomLabelConstraint)
        
        
        let widthLabelConstraint = NSLayoutConstraint(item: newLabel, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.width, multiplier: 1, constant: 100)
        newView.addConstraint(widthLabelConstraint)
        
        let leadingLabelConstraint = NSLayoutConstraint(item: newLabel, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: newView, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 0)
        newView.addConstraint(leadingLabelConstraint)
        
        return newLabel
    }
}

