//
//  ViewController.swift
//  201806_prj_1
//
//  Created by Yen on 2018/6/4.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeTableQueryRightConstraint: NSLayoutConstraint!
    
    var jsonObject: [[AnyHashable:Any]] = []
    
    func transferStationNameToId(stationName:String)->String{
        
        let list = ["南港":"0990","台北": "1000","板橋":"1010","桃園":"1020","新竹":"1030","苗栗":"1035","台中":"1040","彰化":"1043","雲林":"1047","嘉義":"1050","台南":"1060","左營":"1070"]
        var stationId = ""
        for (key,value) in list{
            if key == stationName{
                stationId = value
                break
            }
        }
        
        
        
        return stationId
    }

    @IBAction func onClickTicketQuery(_ sender: Any) {
//        print("BBBsdf")
        let userQueryTimeString = (self.view.viewWithTag(2000)?.viewWithTag(300) as! UILabel).text
        let queryString = userQueryTimeString?.split(separator: " ")
        let queryTime = String(queryString![1])
        
        
        
        let userQueryDepStationString = (self.view.viewWithTag(2000)?.viewWithTag(100) as! UILabel).text
        
        let userQueryDestStationString = (self.view.viewWithTag(2000)?.viewWithTag(200) as! UILabel).text
        
        

        
        
        let runningDay = "Tuesday"
        let depId = transferStationNameToId(stationName: userQueryDepStationString!)
        let destId = transferStationNameToId(stationName: userQueryDestStationString!)
//        print(jsonObject)
        
        
        var direction = 1
        
        if Int(depId)! > Int(destId)!{
            print("北上")
            direction = 1
        }else{
            print("難")
            direction = 0
        }
        
        
        let printList = timeTableQuery(jsonObject: jsonObject, userDepTime: queryTime, direction: direction, depId: depId, destId: destId, runningDay: runningDay)

        
        
        var myTimeTableQueryVC: MyTimeTableQueryViewController!
        
        for vc in (self.childViewControllers) {
            if vc.restorationIdentifier == "myTimeTableQueryVC" {
                myTimeTableQueryVC = vc as! MyTimeTableQueryViewController
                myTimeTableQueryVC.list = printList
                myTimeTableQueryVC.queryResetData()
                break
            }
        }
        
        self.timeTableQueryRightConstraint.constant = 0
        (myTimeTableQueryVC.view.viewWithTag(10) as! UILabel).text = userQueryDepStationString
        (myTimeTableQueryVC.view.viewWithTag(20) as! UILabel).text = userQueryDestStationString
        UIView.animate(withDuration: 0.5){
            self.view.layoutIfNeeded()
            
        }
        
        
        
//        for item in printResult {
//
//            print(item)
//        }
        
//        print(originalId)
//        print(destId)
        
        
        
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
        
        do{
            print("AA")
            if let url = URL(string: "http://oz.nthu.edu.tw/~u9533141/thsr.json"){
                let data = try Data(contentsOf: url)
                self.jsonObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [[String:Any]]
                //                print(jsonObject)
            }
        }catch{
            print("BB")
            print(error)
        }
        
        

    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func timeTableQuery(jsonObject: [[AnyHashable:Any]], userDepTime: String, direction: Int,depId:String,destId:String,runningDay: String ) -> [(key:Date,value:String)] {
        
        var sortedResult : [Date:String] = [:]
        
        for train in jsonObject{
            
            
            
            
            let generalTimetable = train["GeneralTimetable"] as! [AnyHashable : Any]
            let generalTrainInfo = generalTimetable["GeneralTrainInfo"] as! [String: Any]
            let serviceDay = generalTimetable["ServiceDay"] as! [String: Int]
            let stopTimes = generalTimetable["StopTimes"] as! NSArray
            print(serviceDay)
            //let stopInfo = stopTimes[0] as! [String:Any]
            
            //check direction
            if (generalTrainInfo["Direction"] as! Int) != direction{
                continue
            }
            
            //check serviceDay
            
            if serviceDay[runningDay] == 0{
                continue
            }
            
            
            
            
            var originalFoundFlag:Bool = false
            var destFoundFlag:Bool = false
            
            var depTime:String = ""
            var arrTime:String = ""
            
            for eachStop in stopTimes{
                //                print(eachStop)
                let stopInfo = eachStop as! [String:Any]
                if stopInfo["StationID"] as! String == depId{
                    originalFoundFlag = true
                    depTime = stopInfo["DepartureTime"] as! String
//                    print(depTime)
                    
                }
                
                if stopInfo["StationID"] as! String == destId{
                    
                    destFoundFlag = true
                    arrTime = stopInfo["DepartureTime"] as! String
//                    print(arrTime)
                }
                
                if originalFoundFlag,destFoundFlag {
                    //                    print(generalTrainInfo["TrainNo"])
                    
                    let formatter = DateFormatter()
                    formatter.dateFormat = "HH:mm"
                    
                    //                    print(NSTimeZone.local)
                    formatter.timeZone = TimeZone.current
                    //dep time found
                    let depTimeDateType = formatter.date(from: depTime)
                    let arrTimeDateType = formatter.date(from: arrTime)
                    //dep time user input
                    let userDepTimeDateType = formatter.date(from: userDepTime)
                    

                    
                    
                    
                    
                    
                    if depTimeDateType?.compare(userDepTimeDateType!).rawValue as! Int > 0{
                        
                        
                        let interval = Int((arrTimeDateType?.timeIntervalSince(depTimeDateType!))!)
                        let (h,m) = secondsToHoursMinutesSeconds(seconds: interval)
                        
                        if m < 10{
                            sortedResult[depTimeDateType!] = generalTrainInfo["TrainNo"] as! String + "," + depTime + "," + arrTime + "," + "\(h):0\(m)"
                        }else{
                            sortedResult[depTimeDateType!] = generalTrainInfo["TrainNo"] as! String + "," + depTime + "," + arrTime + "," + "\(h):\(m)"
                        }
                        
                    }
                    //                    if ((depTimeDateType?.compare(userDepTimeDateType!))){
                    //
                    //                        list[depTimeDateType!] = generalTrainInfo["TrainNo"] as! String + "," + depTime as! String + "," + arrTime as! String
                    //                    }
                    
                    
                    //                    print(depTime)
                    //                    print(arrTime)
                    //                    print(generalTrainInfo["Direction"])
                    //                    print(serviceDay)
                    break
                }
                
                
            }
            
            //            print(stopInfo["DepartureTime"])
            //            print(stopInfo["StationID"])
            
        }
        
        let orderedResult = sortedResult.sorted{ (d1,d2) -> Bool in
            
            return  d1.key < d2.key
            
        }
        
        
        for item in orderedResult{

            print(type(of: item))
            print(item)

        }
        
        return orderedResult
        
    }
    
    func secondsToHoursMinutesSeconds (seconds : Int) -> (Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60)
    }
}

