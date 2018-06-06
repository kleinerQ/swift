//
//  MySegmentedControl.swift
//  201806_prj_1
//
//  Created by Yen on 2018/6/6.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit

class MySegmentedControl: UISegmentedControl {

    override func awakeFromNib() {
        layer.cornerRadius = 3
        
        layer.borderColor = UIColor.clear.cgColor
        layer.borderWidth = 1
        self.tintColor = UIColor.orange
        
//        let unselectedAttributes = [kCTForegroundColorAttributeName: UIColor.red,
//                                    kCTFontAttributeName:  UIFont.systemFont(ofSize: 103, weight: .regular)]
//        self.setTitleTextAttributes(unselectedAttributes, for: .normal)
    }
    
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
