//
//  ViewController.swift
//  20180527_1
//
//  Created by user on 2018/5/27.
//  Copyright © 2018年 iii. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate  {
    
    @IBOutlet weak var refreshBtn: UIBarButtonItem!
    
    @IBAction func onclickBtn(_ sender: Any) {
        tableView.alpha = 0
        refreshBtn.isEnabled = false
        activity.startAnimating()
        app.uviData.clearJsonObject()
        print(jsonObject)
        app.uviData.loadUVIData()
        資料準備好通知我()
        
        
    }
    @IBOutlet weak var activity: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    var jsonObject:[[String:Any]] = []
    let app = UIApplication.shared.delegate as! AppDelegate
    
    
    func 資料準備好通知我(){
        let q = DispatchQueue.global()
        q.async {
            while self.jsonObject.count == 0, self.app.uviData.jsonDataFlag{
                
                sleep(1)
                self.jsonObject=self.app.uviData.getJsonObject()
            }
            print("data ready")

            DispatchQueue.main.async{
                self.tableView.reloadData()
                self.activity.stopAnimating()
                UIView.animate(withDuration: 0.5){
                    self.tableView.alpha = 1
                }
            }
            
            
        }

        
        refreshBtn.isEnabled = true
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jsonObject.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item = jsonObject[indexPath.row]
        
        var county:String = "未知"
        var siteName:String = "未知"
        var uvi:String = "未知"
        if item["County"] is String{
            
            county = item["County"] as! String
        }
        
        if item["SiteName"] is String{
            
            siteName = item["SiteName"] as! String
        }
        
        if item["UVI"] is String{
            
            uvi = item["UVI"] as! String
        }
        
        cell.textLabel?.text = "\(county) / \(siteName)"
        cell.detailTextLabel?.text = uvi
        
        return cell
    }
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.alpha = 0
        activity.startAnimating()
        資料準備好通知我()
        

        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

