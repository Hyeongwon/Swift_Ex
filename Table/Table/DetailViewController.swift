//
//  DetailViewController.swift
//  Table
//
//  Created by byunhyeongwon on 2017. 6. 8..
//  Copyright © 2017년 Joshua HyeongwonByun. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var receiveItem = "";
    
    @IBOutlet weak var lblItem: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        lblItem.text = receiveItem;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func receiveItem(_ item: String) {
        
        receiveItem = item;
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
