//
//  ViewController.swift
//  20180605_1_web
//
//  Created by Yen on 2018/6/5.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit
import WebKit
class ViewController: UIViewController,UITextFieldDelegate,WKNavigationDelegate,WKUIDelegate {
    
    
    
    var url = URL(string: "https://tw.yahoo.com")
    @IBOutlet weak var btnBack: UIBarButtonItem!
    
    @IBOutlet weak var btnForward: UIBarButtonItem!
    @IBAction func goHome(_ sender: UIBarButtonItem) {
        url = URL(string: "https://tw.yahoo.com")
        let request = URLRequest(url: url!)
        webView.load(request)
        
    }
    @IBAction func reLoad(_ sender: UIBarButtonItem) {
        webView.reload()
    }
    
    @IBAction func goForward(_ sender: Any) {
        
        webView.goForward()
    }
    @IBAction func goBack(_ sender: Any) {
        webView.goBack()
        
    }
    
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        btnBack.isEnabled = webView.canGoBack
        btnForward.isEnabled = webView.canGoForward
    }
    
    
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        
        let userInput = urltext.text!
        if userInput.split(separator: ".").count == 4{
            print("BB")
//            let url = URL(string: "https://www.google.com.tw/search?q=" + urltext.text!)
//            print(url)
        }else{
        
            let url = URL(string: "https://www.google.com.tw/search?q=" + urltext.text!)
    //        let url = URL(string: "https://www.google.com")
            print(url)
            let request = URLRequest(url: url!)
            webView.load(request)
        }
    }
    
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        print("hi")
        
    
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert,animated: true,completion: nil)
        completionHandler()
        
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if urltext.text != ""{
            
            let inputURL = urltext.text
            if ( (inputURL?.count)! >= 8 && inputURL![(inputURL?.startIndex)! ..< (inputURL?.index((inputURL?.startIndex)!, offsetBy: 8))!] == "https://") || ( (inputURL?.count)! >= 7  && inputURL![(inputURL?.startIndex)! ..< (inputURL?.index((inputURL?.startIndex)!, offsetBy: 7))!] == "http://"){
                // user input start from http:// or https:// and string length >= 7 or 8
                url = URL(string: urltext.text!)
                
                
                let request = URLRequest(url: url!)
                webView.load(request)
                
                
            }else{
                // user input directly start from website
                url = URL(string: "https://" + urltext.text!)
            
                print("AA")
                print(url)
            
                let request = URLRequest(url: url!)
                webView.load(request)
                
            }
            
            
            
            //print(inputURL?.index(inputURL?.startIndex, offsetBy))
            
            

//            print(url)
            
        }
        
        
        
        return true
    }
    

//    @IBAction func onClickConfirm(_ sender: UIButton) {
//        if urltext.text != ""{
//
//
//            url = URL(string: "https://" + urltext.text!)
//            print(url)
//
//        }
//
//        let request = URLRequest(url: url!)
//
//        webView.load(request)
//
//
//    }
    
    @IBOutlet weak var urltext: UITextField!
    
    @IBOutlet weak var webView: WKWebView!
    
    
    

   override func viewDidLoad() {
        super.viewDidLoad()
        
//        let url = URL(string: "https://tw.yahoo.com")
    
        let request = URLRequest(url: url!)
        webView.load(request)
    
        webView.navigationDelegate = self
        webView.uiDelegate = self
    
    
    
//        urltext.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

