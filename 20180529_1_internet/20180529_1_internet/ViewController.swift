//
//  ViewController.swift
//  20180529_1_internet
//
//  Created by user on 2018/5/29.
//  Copyright © 2018年 iii. All rights reserved.
//

import UIKit
import SystemConfiguration
class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        

        
        
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        checkNetwork()
        view.endEditing(true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

