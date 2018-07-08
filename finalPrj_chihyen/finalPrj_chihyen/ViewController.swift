//
//  ViewController.swift
//  finalPrj_chihyen
//
//  Created by Yen on 2018/6/30.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit
import CoreBluetooth
import CoreLocation
class ViewController: UIViewController,CLLocationManagerDelegate {
    

    
    let url = URL(string: "http://192.168.211.153/cgi-bin/openLockerCgi.cgi")
    
    @IBAction func onClickOpenLockBtn(_ sender: Any) {
        
        DispatchQueue.global().async {
            let _ = try! String(contentsOf: self.url!)
            
        }
        
        
    }
    
    @IBOutlet weak var openLockBtn: UIButton!
    let lm = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lm.requestAlwaysAuthorization()
        lm.requestWhenInUseAuthorization()
        lm.delegate = self
        openLockBtn.isEnabled = false
        let uuid = UUID(uuidString: "E20A39F4-73F5-4BC4-A12F-17D1AD07A961") //Brand ID
        let region = CLBeaconRegion(proximityUUID: uuid!, identifier: "myregion")
        
        // 用來得知附近 beacon 的資訊。觸發1號method
        lm.startRangingBeacons(in: region)
        // 用來接收進入區域或離開區域的通知。觸發2號與3號method
        lm.startMonitoring(for: region)
        // Do any additional setup after loading the view, typically from a nib.
        

    }
    override func viewDidAppear(_ animated: Bool) {

    }
    /* 1號method */
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        for beacon in beacons {
            print("major=\(beacon.major) minor=\(beacon.minor) accury=\(beacon.accuracy) rssi=\(beacon.rssi)")
            switch beacon.proximity {
            case .far:
                print("beacon距離遠")
                openLockBtn.isEnabled = false
                
            case .near:
                print("beacon距離近")
                openLockBtn.isEnabled = false
                
            case .immediate:
                print("beacon就在旁邊")
                openLockBtn.isEnabled = true
                
            case .unknown:
                print("beacon距離未知")
                openLockBtn.isEnabled = false
            }
        }
    }
    
    /* 2號method */
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        // 進入區域
        print("Enter \(region.identifier)")
    }
    
    /* 3號method */
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        // 離開區域
        print("Exit \(region.identifier)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

