//
//  StreamingViewController.swift
//  finalPrj_chihyen
//
//  Created by Yen on 2018/6/30.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit
import WebKit
class StreamingViewController: UIViewController {

    
    @IBOutlet weak var activityIcon: UIActivityIndicatorView!
    
    @IBOutlet weak var streamingWebView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
        
        NotificationCenter.default.addObserver(self, selector: #selector(streamingWebViewReload), name: Notification.Name.UIApplicationDidBecomeActive, object: nil)
        
        
    }
    
    @objc func streamingWebViewReload(){
        streamingWebView.reload()
        print("goBack")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        //print("viewdidAppear")
        

        
        let openStreamUrl = URL(string: "http://10.3.141.111/cgi-bin/streaming.cgi")
        let stopStreamUrl = URL(string: "http://10.3.141.111/cgi-bin/stopStreaming.cgi")
        

        
        DispatchQueue.global().async {


            do{
                DispatchQueue.main.sync {
                    self.activityIcon.startAnimating()
                }
                let _ = try String(contentsOf: stopStreamUrl!)
                sleep(1)
                print("abcde")
                let _ = try String(contentsOf: openStreamUrl!)

                var timer:Timer!
                timer = Timer.scheduledTimer(timeInterval: 6, target: self, selector: #selector(self.loadWebView), userInfo: nil, repeats: false)

                
                
            }catch{
                
                print("Open Streaming Fail")
            }
            
            
        }
        
        //sleep(10)

        


        

    }
    
    
    @objc func loadWebView(){
        self.activityIcon.stopAnimating()
        let url = URL(string: "http://10.3.141.111/streaming/stream.m3u8")
        let request = URLRequest(url: url!)
        self.streamingWebView.load(request)
        
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        let stopStreamUrl = URL(string: "http://10.3.141.111/cgi-bin/stopStreaming.cgi")
        
        DispatchQueue.global().async {
            do{
                let _ = try String(contentsOf: stopStreamUrl!)
            }catch{
                
                print("Stop Streaming Fail")
            }
            
        }
        //print("viewdiddisAppear")
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
