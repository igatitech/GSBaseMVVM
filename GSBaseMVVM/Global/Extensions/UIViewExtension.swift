//
//  UIViewExtension.swift
//  GSBaseMVVM
//
//  Created by Gati Shah on 07/03/20.
//  Copyright © 2020 iGatiTech. All rights reserved.
//

import Foundation
import UIKit

enum VerticalLocation: String {
    case bottom
    case top
}

extension UIView
{
    func showToast(toastMessage:String,duration:CGFloat? = 0.3)
    {
        //View to blur bg and stopping user interaction
        let bgView = UIView(frame: self.frame)
        bgView.backgroundColor = UIColor(red: CGFloat(255.0/255.0), green: CGFloat(255.0/255.0), blue: CGFloat(255.0/255.0), alpha: CGFloat(0.0))
        bgView.tag = 555
        
        //Label For showing toast text
        let lblMessage = UILabel()
        lblMessage.numberOfLines = 0
        lblMessage.lineBreakMode = .byWordWrapping
        lblMessage.textColor = .white
        lblMessage.backgroundColor = .darkGray
        lblMessage.textAlignment = .center
        lblMessage.font = UIFont.systemFont(ofSize: 16)
        lblMessage.text = toastMessage
        
        //calculating toast label frame as per message content
        let maxSizeTitle : CGSize = CGSize(width: self.bounds.size.width-16, height: self.bounds.size.height)
        var expectedSizeTitle : CGSize = lblMessage.sizeThatFits(maxSizeTitle)
        // UILabel can return a size larger than the max size when the number of lines is 1
        expectedSizeTitle = CGSize(width:maxSizeTitle.width.getminimum(value2:expectedSizeTitle.width), height: maxSizeTitle.height.getminimum(value2:expectedSizeTitle.height))
        lblMessage.frame = CGRect(x:((self.bounds.size.width)/2) - ((expectedSizeTitle.width+16)/2) , y: ((self.bounds.size.height - 20) - (expectedSizeTitle.height+22+self.safeAreaInsets.bottom)), width: expectedSizeTitle.width+16, height: expectedSizeTitle.height+16)
        lblMessage.layer.cornerRadius = 8
        lblMessage.layer.masksToBounds = true
        lblMessage.layoutMargins = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        bgView.addSubview(lblMessage)
        self.addSubview(bgView)
        lblMessage.alpha = 0
        UIView.animateKeyframes(withDuration:TimeInterval(duration ?? 0.0) , delay: 0, options: [] , animations: {
            lblMessage.alpha = 1
        }, completion: {
            sucess in
            UIView.animate(withDuration: TimeInterval(duration ?? 0.0), delay: 1, options: [], animations: {
                lblMessage.alpha = 0
                bgView.alpha = 0
            }, completion: { (success) in
                bgView.removeFromSuperview()
            })
        })
    }
    
    //MARK:- Show/HideView
    func showView() {
        self.alpha = 0.0
        UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseInOut, animations: {
            self.isHidden = false
            self.alpha = 1.0
            self.transform = CGAffineTransform.init(scaleX: 1.1, y: 1.1)
        }) { (isFinished) in
            
            UIView.animate(withDuration: 0.5, animations: {
                self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            })
        }
    }
    
    func hideView() {
        self.alpha = 1.0
        UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveEaseInOut, animations: {
            self.transform = CGAffineTransform.init(scaleX: 0.1, y: 0.1)
            self.alpha = 0.0
            
        }, completion: { (finished: Bool) -> () in
        })
    }
    
    func addShadow(location: VerticalLocation, color: UIColor = .black, opacity: Float = 0.15, radius: CGFloat = 1.0) {
        switch location {
        case .bottom:
            showShadow(offset: CGSize(width: 0, height: 2), color: color, opacity: opacity, radius: radius)
        case .top:
            showShadow(offset: CGSize(width: 0, height: -2), color: color, opacity: opacity, radius: radius)
        }
    }
    
    func showShadow(offset: CGSize, color: UIColor = .black, opacity: Float = 0.15, radius: CGFloat = 1.0) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
    }
}
extension CGFloat
{
    func getminimum(value2:CGFloat)->CGFloat
    {
        if self < value2
        {
            return self
        }
        else
        {
            return value2
        }
    }
}
