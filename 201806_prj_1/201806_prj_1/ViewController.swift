//
//  ViewController.swift
//  201806_prj_1
//
//  Created by Yen on 2018/6/4.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var backgroundLayerBottomContraint: NSLayoutConstraint!
    @IBOutlet weak var datePickViewBottom: NSLayoutConstraint!
    @IBOutlet weak var ticketNumberPickViewBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var pickViewBottomConstraint: NSLayoutConstraint!
    
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        print("GGGADF")
        
        var mybookingTableViewVC: MyBookingTableViewController!
        for vc in (self.childViewControllers) {
            if vc.restorationIdentifier == "bookingTableView" {
                mybookingTableViewVC = vc as! MyBookingTableViewController
                break
            }
        }
        mybookingTableViewVC.resetOriginalStaion()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    
}

