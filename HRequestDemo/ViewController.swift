//
//  ViewController.swift
//  HRequestDemo
//
//  Created by KingCQ on 2017/1/16.
//  Copyright © 2017年 KingCQ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        test()
    }
    
    
    func test() {
        let uri = "http://www.oschina.net/action/apiv2/news"
       
        HRequest.default.request(uri)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

