//
//  ViewController.swift
//  Tab
//
//  Created by byunhyeongwon on 2017. 6. 5..
//  Copyright © 2017년 Joshua HyeongwonByun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btnMoveImageView(_ sender: UIButton) {
        
        tabBarController?.selectedIndex = 1;
    }

    @IBAction func btnMoveDatePickerView(_ sender: UIButton) {
        
        tabBarController?.selectedIndex = 2;
    }
    

}

