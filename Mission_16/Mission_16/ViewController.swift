//
//  ViewController.swift
//  Mission_16
//
//  Created by byunhyeongwon on 2017. 7. 14..
//  Copyright © 2017년 Joshua HyeongwonByun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        UIGraphicsBeginImageContext(imgView.frame.size);
        let context = UIGraphicsGetCurrentContext()!;
        
        // Draw Triangle
        context.setLineWidth(1.0);
        context.setStrokeColor(UIColor.brown.cgColor);
        context.setFillColor(UIColor.brown.cgColor);
        
        context.move(to: CGPoint(x: 140, y: 450))
        context.addLine(to: CGPoint(x: 170, y: 200));
        context.addLine(to: CGPoint(x: 210, y: 450));
        context.addLine(to: CGPoint(x: 140, y: 450));
        context.fillPath();
        context.strokePath();
        
        // Draw Circle
        context.setLineWidth(1.0);
        context.setStrokeColor(UIColor.green.cgColor);
        
        context.addEllipse(in: CGRect(x: 120, y: 150, width: 100, height: 100));
        context.strokePath();
        context.addEllipse(in: CGRect(x: 120 + 50, y: 150, width: 100, height: 100));
        context.strokePath();
        context.addEllipse(in: CGRect(x: 120 - 50, y: 150, width: 100, height: 100));
        context.strokePath();
        context.addEllipse(in: CGRect(x: 120, y: 150 - 50, width: 100, height: 100));
        context.strokePath();
        context.addEllipse(in: CGRect(x: 120, y: 150 + 50, width: 100, height: 100));
        context.strokePath();
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        print(imgView.frame.size);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

