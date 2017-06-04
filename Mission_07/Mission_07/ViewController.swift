//
//  ViewController.swift
//  Mission_07
//
//  Created by byunhyeongwon on 2017. 6. 4..
//  Copyright © 2017년 Joshua HyeongwonByun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mywebView: UIWebView!
    
    func loadWebPage(_ url: String) {
        let myUrl = URL(string: url);
        let myRequest = URLRequest(url: myUrl!);
        
        mywebView.loadRequest(myRequest);
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let myHtmlBundle = Bundle.main;
        let filePath = myHtmlBundle.path(forResource: "htmlView", ofType: "html");
        loadWebPage(filePath!);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

