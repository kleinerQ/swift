//
//  MyCamViewController.swift
//  201806_prj_1
//
//  Created by Yen on 2018/6/11.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit
import AVFoundation

class MyCamViewController: UIViewController {

    
    let session = AVCaptureSession()
    let deviceInput = DeviceInput()
    
    @IBOutlet weak var forPreview: UIView!
    @IBAction func frontBackCamSwitch(_ sender: UISwitch) {
        
        session.beginConfiguration()
        session.removeInput(session.inputs.last!)
        if sender.isOn{
            
            session.addInput(deviceInput.backWildAngleCamera!)
            
        }else{
            
            session.addInput(deviceInput.frontWildAngleCamera!)
            
        }
        
        session.commitConfiguration()
        
    }
    
    func settingPreviewLayer(){
        let previewLayer = AVCaptureVideoPreviewLayer()
        previewLayer.frame = forPreview.bounds
        previewLayer.session = session
        previewLayer.videoGravity = .resizeAspectFill
        forPreview.layer.addSublayer(previewLayer)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingPreviewLayer()
        session.addInput(deviceInput.backWildAngleCamera!)
        session.startRunning()

        let previewLayer = AVCaptureVideoPreviewLayer()
        previewLayer.frame = forPreview.bounds
        previewLayer.session = session
        previewLayer.videoGravity = .resizeAspectFill
        forPreview.layer.addSublayer(previewLayer)
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
