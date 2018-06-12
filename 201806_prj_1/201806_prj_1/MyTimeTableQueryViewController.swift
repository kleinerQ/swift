//
//  MyTimeTableQueryViewController.swift
//  201806_prj_1
//
//  Created by Yen on 2018/6/12.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit

class MyTimeTableQueryViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    @IBAction func onClickGoEarlyQuery(_ sender: UIButton) {
        
        
        
    }
    
    @IBAction func onClickGoLaterQuery(_ sender: UIButton) {
    }
    let showTimeTableItemNumber = 5
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBAction func onClickRequery(_ sender: UIBarButtonItem) {
        let parentVc = parent as! ViewController
        parentVc.timeTableQueryRightConstraint.constant = -380
        
        UIView.animate(withDuration: 0.5){
            (self.parent as! ViewController).view.layoutIfNeeded()
        }

    }
    
    
    
    
    var list:[(key:Date,value:String)] = []
    var printList:[String] = []
    
    func queryResetData(){
        var i = 0
        
        printList.removeAll()
        for (key,value) in list{
            if i < showTimeTableItemNumber{
                printList.append(value)
            }
            
            i = i + 1
        }
//        print(printList)
        tableView.reloadData()
        
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print(printList.count)
        return printList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let trainNoLabel = (cell.viewWithTag(100) as! UILabel)
        let depTimeLabel = (cell.viewWithTag(200) as! UILabel)
        let arrTimeNoLabel = (cell.viewWithTag(400) as! UILabel)
        let timeDiffNoLabel = (cell.viewWithTag(500) as! UILabel)
        
        let item = printList[indexPath.row].split(separator: ",")
//        print(item)
        trainNoLabel.text = String(item[0])
        depTimeLabel.text = String(item[1])
        arrTimeNoLabel.text = String(item[2])
        timeDiffNoLabel.text = String(item[3])
        return cell
        
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
