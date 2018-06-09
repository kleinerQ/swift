//
//  MyDatePickViewController.swift
//  201806_prj_1
//
//  Created by Yen on 2018/6/6.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit

class MyDatePickViewController: UIViewController {
    
    var timeString: String = ""
    
    @IBAction func onClickComplete(_ sender: UIButton) {
        let dateLabel = parent?.view.viewWithTag(2000)?.viewWithTag(300) as! UILabel
        

        
        
        dateLabel.text = timeString
        
        let parentVc = parent as! ViewController

        parentVc.datePickViewBottom.constant = -300
        UIView.animate(withDuration: 0.5){
            (self.parent as! ViewController).view.layoutIfNeeded()
        }
        
        (parent as! ViewController).tabBarController?.tabBar.isHidden = false
        
                //print(timeString)
        
    }
    
    
    @IBAction func onClickTodayBtn(_ sender: UIButton) {
        datePick.setDate(Date(), animated: true)
        
    }
    
    
    @IBOutlet weak var datePick: UIDatePicker!
    @IBAction func onValueChange(_ sender: UIDatePicker) {
        datePick.minimumDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        timeString = formatter.string(from: sender.date)

    }
    override func viewDidLoad() {
        super.viewDidLoad()

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        timeString = formatter.string(from: Date())
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
