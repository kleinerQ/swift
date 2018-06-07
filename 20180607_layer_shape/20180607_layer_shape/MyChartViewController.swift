//
//  MyChartViewController.swift
//  20180607_layer_shape
//
//  Created by Yen on 2018/6/7.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit

class MyChartViewController: UIViewController {
    
    func drawRect(withColor color: CGColor) -> CAShapeLayer{
        
        
        let paintLineWidth:CGFloat = 3
        
        let diagramWidth = view.frame.size.width
        let diagramHeight = view.frame.size.height
        
        
        let shapeLayer = CAShapeLayer()
        let rectPath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: diagramWidth, height: diagramHeight))
        shapeLayer.strokeColor = color
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.borderWidth = paintLineWidth
        shapeLayer.lineWidth = paintLineWidth
        shapeLayer.path = rectPath.cgPath
        

        
        
        
        return shapeLayer
        
        //119 103 69
        
    }
    
 

    
    func drawTableLine() -> CAShapeLayer{
        
        
        let shapeLayer = CAShapeLayer()
        let linePath = UIBezierPath()
        let diagramWidth = view.frame.size.width
        let diagramHeight = view.frame.size.height
        let diagramShare = 10
        for index in 0 ..< diagramShare {
            //print(diagramHeight)
            linePath.move(to: CGPoint(x: 0, y: diagramHeight / CGFloat(diagramShare) * CGFloat(index)))
            linePath.addLine(to: CGPoint(x: diagramWidth, y: diagramHeight/CGFloat(diagramShare) * CGFloat(index)))
        }

        shapeLayer.strokeColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 0.1
        shapeLayer.path = linePath.cgPath
        
        
        
        
        return shapeLayer
        
    }
    // input(0,100)
    func drawLine(dataList:[Float]) -> CAShapeLayer{
        
        let numberOfData = dataList.count
        let shapeLayer = CAShapeLayer()
        let linePath = UIBezierPath()
    

        
        
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineDashPattern = [3,3]
        shapeLayer.lineJoin = kCALineJoinRound
        
        let diagramWidth = view.frame.size.width
        let diagramHeight = view.frame.size.height
        let diagramWidthShare = numberOfData + 1
        linePath.move(to: CGPoint(x: CGFloat(diagramWidth) / CGFloat(diagramWidthShare), y: CGFloat(dataList[0]) * CGFloat(diagramHeight) / CGFloat(-100) + CGFloat(diagramHeight) ) )

        for index in 0 ..< numberOfData {

            linePath.addLine(to: CGPoint(x: CGFloat(diagramWidth) / CGFloat(diagramWidthShare) * CGFloat(index+1) , y: CGFloat(dataList[index]) * CGFloat(diagramHeight) / CGFloat(-100) + CGFloat(diagramHeight)))
        }
        
        shapeLayer.strokeColor = UIColor.green.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.path = linePath.cgPath
        
        
        
        
        return shapeLayer
        
        
    }

    override func viewDidAppear(_ animated: Bool) {
        view.layer.addSublayer(drawRect(withColor: UIColor.red.cgColor))
        view.layer.addSublayer(drawTableLine())
        view.layer.addSublayer(drawLine(dataList: [20,40,30,50,79,20,3]))
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
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
