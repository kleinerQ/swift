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


    
    @IBOutlet weak var streamingWebView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        print("AA")

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewdidAppear")
        

        let openStreamUrl = URL(string: "http://192.168.43.6/cgi-bin/streaming.cgi")
        


        DispatchQueue.global().async {


            do{
                print("DSF")
                let _ = try String(contentsOf: openStreamUrl!)
                
            }catch{
                
                print("Open Streaming Fail")
            }
            
            
        }
        //print("SDFg")
        sleep(4)
        let url = URL(string: "http://192.168.43.6/streaming/stream.m3u8")
        let request = URLRequest(url: url!)
        self.streamingWebView.load(request)

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        let stopStreamUrl = URL(string: "http://192.168.43.6/cgi-bin/stopStreaming.cgi")
        
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
