//
//  ViewController.swift
//  20180603_1
//
//  Created by user on 2018/6/3.
//  Copyright © 2018年 iii. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    var list = [["台北\n松山\n基隆\n松山\n基隆\n松山\n基隆\n松山\n基隆\n松山\n基隆\n松山\n基隆\n松山\n基隆\n松山\n基隆\n松山\n基隆\n松山\n基隆\n松山\n基隆\n松山\n基隆\n松山\n基隆\n松山\n基隆","台中","🍎","高雄\n台南"],["松山\n基隆","台中","🍎","高雄\n台南"]]
    var isCollapse:Bool = true
    var isSectionCollapseArray:[Bool] = [false,false]
    var isSectionCollapse:Bool = false
    var nowActionSection = 0
    var headerHeight:CGFloat = 0
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

