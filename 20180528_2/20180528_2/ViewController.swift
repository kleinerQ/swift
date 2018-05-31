//
//  ViewController.swift
//  20180528_2
//
//  Created by user on 2018/5/28.
//  Copyright © 2018年 iii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var alertText: UITextField!
    
    func 完成後請通知我(_ text:String?){
        if let text = text{
            //print(text)
            alertText.isHidden = false
            label.isHidden = false
            alertText.text = text
            
        }
    }

    @IBAction func onclick(_ sender: Any) {
        
        let alert = storyboard?.instantiateViewController(withIdentifier: "myalert")
        present(alert!, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        alertText.isHidden = true
        label.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

