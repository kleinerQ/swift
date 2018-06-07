//
//  ViewController.swift
//  20180607_layer_shape
//
//  Created by Yen on 2018/6/7.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    func drawLine() -> CAShapeLayer{
        
        let linePath = UIBezierPath()
        let shapeLayer = CAShapeLayer()
        
        
        
        
        
        linePath.move(to: CGPoint(x: 10, y: 10))
        linePath.addLine(to: CGPoint(x: 200, y: 200))
        linePath.addLine(to: CGPoint(x: 100, y: 250))
        //        linePath.close()
        
        shapeLayer.name = "aaa"
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 20
        shapeLayer.lineDashPattern = [10,3]
        shapeLayer.lineJoin = kCALineJoinBevel
        shapeLayer.path = linePath.cgPath
        
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        //print(shapeLayer.frame)
        //        print(screenHeight)
        return shapeLayer
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        view.layer.addSublayer(drawLine())
       
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("AAA")
        guard let point = touches.first?.location(in: view) else{
            print("AAA4")
            return
        }
        print(point)
        guard let layer = view.layer.hitTest(point) else{
            print("AAA5")
            return
        }
        print(layer)
        guard let layerName = layer.name else{
            print("AAA6")
            return
        }
        print(layerName)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! CircleViewController
        vc.currentValue = 10
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

