//
//  ViewController.swift
//  Sketch
//
//  Created by byunhyeongwon on 2017. 7. 16..
//  Copyright © 2017년 Joshua HyeongwonByun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var txtChangeLine_Size: UITextField!
    
    var lastPoint: CGPoint!;
    var lineSize: CGFloat = 2.0;
    var linecolor = UIColor.red.cgColor;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtChangeLine_Size.text = String(Int(lineSize))
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clearImageView(_ sender: UIButton) {
        
        imgView.image = nil;
    }
    @IBAction func changeLineColor_Black(_ sender: UIButton) {
     
        linecolor = UIColor.black.cgColor;
    }
    
    @IBAction func changeLineColor_Red(_ sender: UIButton) {
        
        linecolor = UIColor.red.cgColor;
    }
    
    @IBAction func changeLineColor_Green(_ sender: UIButton) {
        
        linecolor = UIColor.green.cgColor;
    }
    
    @IBAction func changeLineColor_Blue(_ sender: UIButton) {
        
        linecolor = UIColor.blue.cgColor;
    }
    
    @IBAction func changeLineSize(_ sender: UITextField) {
        
        if txtChangeLine_Size.text != "" {
            lineSize =    CGFloat(Int(txtChangeLine_Size.text!)!)
        }

    }
    
    @IBAction func txtDidEndOnExit(_ sender: UITextField) {
        
        lineSize =    CGFloat(Int(txtChangeLine_Size.text!)!)
    }
    
    @IBAction func txtTouchDown(_ sender: UITextField) {
        
        txtChangeLine_Size.selectAll(UITextField.self)
    }
  
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first! as UITouch
        lastPoint = touch.location(in: imgView);
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        UIGraphicsBeginImageContext(imgView.frame.size);
        UIGraphicsGetCurrentContext()?.setStrokeColor(linecolor);
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round);
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSize);
        
        let touch = touches.first! as UITouch;
        let currPoint = touch.location(in: imgView);
        
        imgView.image?.draw(in: CGRect(x: 0, y: 0, width: imgView.frame.size.width, height: imgView.frame.size.height));
        
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: currPoint.x, y: currPoint.y));
        UIGraphicsGetCurrentContext()?.addLine(to:  CGPoint(x: currPoint.x, y: currPoint.y));
        UIGraphicsGetCurrentContext()?.strokePath();
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        lastPoint = currPoint;
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        UIGraphicsBeginImageContext(imgView.frame.size);
        UIGraphicsGetCurrentContext()?.setStrokeColor(linecolor);
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round);
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSize);
        
        
        imgView.image?.draw(in: CGRect(x: 0, y: 0, width: imgView.frame.size.width, height: imgView.frame.size.height));
        
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y));
        UIGraphicsGetCurrentContext()?.addLine(to:  CGPoint(x: lastPoint.x, y: lastPoint.y));
        UIGraphicsGetCurrentContext()?.strokePath();
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        if motion == .motionShake {
            
            imgView.image = nil;
        }
    }
    
    
}

