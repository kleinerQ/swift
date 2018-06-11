//
//  ViewController.swift
//  201806_prj_1
//
//  Created by Yen on 2018/6/4.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBAction func onClickTicketQuery(_ sender: Any) {
        print("BBBsdf")
        let userQueryString = (self.view.viewWithTag(2000)?.viewWithTag(300) as! UILabel).text
        let queryString = queryString?.split(separator: " ")
        let queryTime = queryString![1]
        
        
    }
    
    var originalX:CGFloat! = 0
    
    @IBAction func onPanEdgeGestureCamera(_ sender: UIScreenEdgePanGestureRecognizer) {
        
//        let location = sender.location(in: view)
//        let camVCWidth = self.view.frame.size.width
//        print(camVCWidth)
//        //        print(location)
//
//        //        print(tubeWidth)
//        //        print(containerWidth)
//        //        print(movingBarWidth)
//
//        switch sender.state {
//        case .began:
//            originalX = location.x
//
//        case .ended:
//            print(camVcLeftContraint.constant)
//            if camVcLeftContraint.constant > 0{
//                camVcLeftContraint.constant = 0
//            }else if camVcLeftContraint.constant > (-1 * camVCWidth){
//                camVcLeftContraint.constant = 0
//            }
//
//
//            UIView.animate(withDuration: 0.5){
//                self.view.layoutIfNeeded()
//            }
//
//
//        case .changed:
//            let movingQuantity = location.x - originalX
//            if movingQuantity + ((-1) * camVCWidth) > 0 {
//                camVcLeftContraint.constant = 0
//            }else{
//                camVcLeftContraint.constant = -1 * camVCWidth + movingQuantity
//            }
//
//
//            UIView.animate(withDuration: 0.5){
//                self.view.layoutIfNeeded()
//            }
//
//        default:
//            break
//        }
        
        
    }
    
    
    @IBOutlet weak var camVcLeftContraint: NSLayoutConstraint!
    
    
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

