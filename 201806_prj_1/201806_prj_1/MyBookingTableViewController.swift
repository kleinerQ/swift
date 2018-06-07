//
//  MyBookingTableViewController.swift
//  201806_prj_1
//
//  Created by Yen on 2018/6/6.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit

class MyBookingTableViewController: UITableViewController {
    
    @IBAction func onClickShowNumberTicketPickView(_ sender: UITapGestureRecognizer) {
        
        (parent as! ViewController).ticketNumberPickViewBottomConstraint.constant = 0
        UIView.animate(withDuration: 0.5){
            (self.parent as! ViewController).view.layoutIfNeeded()
        }
        
    }
    @IBAction func onClickShowDatePickView(_ sender: Any) {
        (parent as! ViewController).datePickViewBottom.constant = 0
        UIView.animate(withDuration: 0.5){
            (self.parent as! ViewController).view.layoutIfNeeded()
        }
        
    }
    
    var isCollapse:Bool = true
    @IBOutlet var bookingTableView: UITableView!
    
    
    
    @IBAction func onChoiceTicketType(_ sender: UISegmentedControl) {
        
       
        if sender.selectedSegmentIndex == 0{
//            print("AAAAAA")
            isCollapse = true

//            tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
            bookingTableView.reloadData()
        }else{
            isCollapse = false
//            print("GG")

            bookingTableView.reloadData()
        }
        
        
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 2, isCollapse{
            return 0
        }
        return UITableViewAutomaticDimension
    }
    
    @IBOutlet weak var date: UILabel!
    
    @IBAction func onClickShowPickView(_ sender: Any) {
        (parent as! ViewController).pickViewBottomConstraint.constant = 0
        UIView.animate(withDuration: 0.5){
            (self.parent as! ViewController).view.layoutIfNeeded()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        let timeString = formatter.string(from: Date())
        date.text = timeString
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
