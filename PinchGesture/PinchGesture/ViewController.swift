//
//  ViewController.swift
//  PinchGesture
//
//  Created by byunhyeongwon on 2017. 8. 5..
//  Copyright © 2017년 Joshua HyeongwonByun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgPinch: UIImageView!
    
    var initialFontSize:CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector (ViewController.doPinch(_:)))
        self.view.addGestureRecognizer(pinch);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func doPinch(_ pinch: UIPinchGestureRecognizer) {
        
        /*
        if(pinch.state == UIGestureRecognizerState.began) {
            
            initialFontSize = txtPinch.font.pointSize
        } else {
            
            txtPinch.font = txtPinch.font.withSize(initialFontSize * pinch.scale);
        }*/
        
        imgPinch.transform = imgPinch.transform.scaledBy(x: pinch.scale, y: pinch.scale);
        
        pinch.scale = 1;
    }

}

