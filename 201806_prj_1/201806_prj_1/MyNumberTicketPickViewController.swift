//
//  MyNumberTicketPickViewController.swift
//  201806_prj_1
//
//  Created by Yen on 2018/6/7.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit

class MyNumberTicketPickViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    var numberOfType = 5
//    @IBAction func onclickTest(_ sender: UIButton) {
    @IBOutlet weak var pickViewUniLabel: UILabel!
    //        numberOfType = 5
//        
//        let this = numberTicketPicker
//        print(numberOfType)
//        print(this)
//        this?.backgroundColor = .red
//        numberTicketPicker.reloadAllComponents()
//    }
    
    
    @IBAction func onClickComplete(_ sender: UIButton) {
        
        let parentVc = parent as! ViewController
        parentVc.ticketNumberPickViewBottomConstraint.constant = -300
        parentVc.backgroundLayerBottomContraint.constant = -800
        UIView.animate(withDuration: 0.5){
            (self.parent as! ViewController).view.layoutIfNeeded()
        }
        
        
        let firstLable = parentVc.view.viewWithTag(2000)?.viewWithTag(400) as! UILabel
        let secondLable = parentVc.view.viewWithTag(2000)?.viewWithTag(500) as! UILabel
        let thirdLable = parentVc.view.viewWithTag(2000)?.viewWithTag(600) as! UILabel
        let fourthLable = parentVc.view.viewWithTag(2000)?.viewWithTag(700) as! UILabel
        let fifthLable = parentVc.view.viewWithTag(2000)?.viewWithTag(800) as! UILabel
        
        let firstPickedValue = list[numberTicketPicker.selectedRow(inComponent: 0)]
        let secondPickedValue = list[numberTicketPicker.selectedRow(inComponent: 1)]
        let thirdPickedValue = list[numberTicketPicker.selectedRow(inComponent: 2)]
        let fourthPickedValue = list[numberTicketPicker.selectedRow(inComponent: 3)]
        if self.numberOfType == 5 {
            let fifthPickedValue = list[numberTicketPicker.selectedRow(inComponent: 4)]
            fifthLable.text = "大學生 \(fifthPickedValue)"
        }
        firstLable.text = "全票 \(firstPickedValue)"
        secondLable.text = "孩童 \(secondPickedValue)"
        thirdLable.text = "敬老 \(thirdPickedValue)"
        fourthLable.text = "愛心 \(fourthPickedValue)"
        
        (parent as! ViewController).tabBarController?.tabBar.isHidden = false
        
    }
    
    @IBOutlet weak var numberTicketPicker: UIPickerView!
    
//    func reloadMyTicketPickView(){
////        let this = numberTicketPicker
////        print(numberOfType)
////        print(this)
////        this?.backgroundColor = .red
////        //print(numberTicketPicker)
//        numberTicketPicker.reloadAllComponents()
//        
//    }
//    
    let list = ["0","1","2","3","4","5","6","7","8","9","10"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return numberOfType
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[row]
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
