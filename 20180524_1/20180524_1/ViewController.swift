//
//  ViewController.swift
//  20180524_1
//
//  Created by user on 2018/5/24.
//  Copyright © 2018年 iii. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    let app = UIApplication.shared.delegate as! AppDelegate // for get the variable declared in AppDelegate
    var jsonObject: [[String:Any]] = []
    
    let list = ["台北","台中","高雄"]
    
   // called when entering the app
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jsonObject.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let item = jsonObject[indexPath.row]
        var county: String = "未知"
        var siteName: String = "未知"
        var uvi: String = "未知"
        cell.imageView?.image=nil
        cell.textLabel?.textColor = UIColor.black
        cell.detailTextLabel?.textColor = cell.textLabel?.textColor
        
        if item["County"] is String{
            county = item["County"] as! String
        }
        
        if item["SiteName"] is String{
            siteName = item["SiteName"] as! String
        }
        
        if item["UVI"] is String{
            uvi = item["UVI"] as! String
            
            cell.backgroundColor = getCellBGColorByUVI(Float(uvi),cell: cell);

//            if Float(uvi) != nil{
//            switch Float(uvi)! {
//            case 0 ..< 3 :
//                cell.backgroundColor = UIColor.green;
//            case 3 ..< 6 :
//                cell.backgroundColor = UIColor.yellow;
//            case 6 ..< 8:
//                cell.backgroundColor = UIColor.orange;
//            case 8 ..< 11:
//                cell.backgroundColor = UIColor.red;
//            case 11 ..< 100:
//                cell.backgroundColor = UIColor.purple;
//
//            default:
//                cell.backgroundColor = UIColor.white;
//
//            }
//            }else{
//
//                cell.backgroundColor = UIColor.white;
//            }
//            if Float(uvi) != nil, Float(uvi)! < 8  {
//                cell.backgroundColor = UIColor.green;
//            }else{
//                cell.backgroundColor = UIColor.white;
//            }
            
            
        }
        cell.textLabel?.text = county + "/" + siteName
        cell.detailTextLabel?.text = uvi
        return cell
    }
    
    func getCellBGColorByUVI(_ value: Float?, cell: UITableViewCell)-> UIColor{
        var color: UIColor = UIColor.white
        
        guard let value = value else{
            return color
        }
        switch value {
        case 0..<3:
            color = UIColor(red: 46/255, green: 255/255, blue: 23/255, alpha: 1)
            cell.imageView?.image = UIImage(named: "green")
            cell.textLabel?.textColor = UIColor.brown
            cell.detailTextLabel?.textColor = cell.textLabel?.textColor
        case 3..<6:
            color = UIColor(red: 246/255, green: 226/255, blue: 50/255, alpha: 1)
            cell.imageView?.image = UIImage(named: "yellow")
            cell.textLabel?.textColor = UIColor.purple
            cell.detailTextLabel?.textColor = cell.textLabel?.textColor
        case 6..<8:
            color = UIColor(red: 252/255, green: 151/255, blue: 54/255, alpha: 1)
            cell.imageView?.image = UIImage(named: "orange")
            cell.textLabel?.textColor = UIColor.gray
            cell.detailTextLabel?.textColor = cell.textLabel?.textColor
        case 8..<11:
            color = UIColor(red: 253/255, green: 29/255, blue: 74/255, alpha: 1)
            cell.imageView?.image = UIImage(named: "red")
            cell.textLabel?.textColor = UIColor.blue
            cell.detailTextLabel?.textColor = cell.textLabel?.textColor
        case 11..<100:
            color = UIColor(red: 222/255, green: 151/255, blue: 141/255, alpha: 1)
            cell.imageView?.image = UIImage(named: "purple")
            cell.textLabel?.textColor = UIColor.green
            cell.detailTextLabel?.textColor = cell.textLabel?.textColor
        default:
            break
        }
        return color
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        jsonObject = app.uviData.getJsonObject()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

