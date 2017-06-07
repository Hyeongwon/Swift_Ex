//
//  ViewController.swift
//  Navigation
//
//  Created by byunhyeongwon on 2017. 6. 5..
//  Copyright © 2017년 Joshua HyeongwonByun. All rights reserved.
//

import UIKit

protocol EditDelegate {
    func didMessageEditDone(_ controller:EditViewController, message: String);
    func didImageOnOffDone(_ controller:EditViewController, isOn: Bool);
    func didImageZoomDone(_ controller:EditViewController, isZoom: Bool);
}

class ViewController: UIViewController, EditDelegate {
    
    let imgOn = UIImage(named: "OnLamp.png");
    let imgOff = UIImage(named: "OffLamp.png");
    
    var isOn = true;
    var isZoom = false;
    var oriZoom = false;

    @IBOutlet weak var txtMessage: UITextField!
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imgView.image = imgOn;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as!
            EditViewController
        
        if segue.identifier == "editButton" {
            
            editViewController.textWayValue = "segue : use button";
            
        } else if segue.identifier == "editBarButton" {
            
            editViewController.textWayValue = "segue : use bar button";
            
        }
        editViewController.textMessage = txtMessage.text!;
        editViewController.isOn = isOn;
        editViewController.delegate = self;
        editViewController.isZoom = oriZoom;
    }
    
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txtMessage.text = message;
    }
    
    func didImageOnOffDone(_ controller:EditViewController, isOn: Bool) {
        
        if isOn {
            
            imgView.image = imgOn;
            self.isOn = true;
            
        } else {
            
            imgView.image = imgOff;
            self.isOn = false;
            
        }
    }
    
    func didImageZoomDone(_ controller: EditViewController, isZoom: Bool) {
        
        let scale:CGFloat = 2.0;
        var newWidth:CGFloat, newHeight:CGFloat;
        
        if isZoom {
            if oriZoom {
                
            } else {
                self.isZoom = false
                self.oriZoom = true
                newWidth = imgView.frame.width*scale
                newHeight = imgView.frame.height*scale
                imgView.frame.size = CGSize(width: newWidth, height: newHeight)
            }
        } else {
            if oriZoom  {
                self.isZoom = true
                self.oriZoom = false
                newWidth = imgView.frame.width/scale
                newHeight = imgView.frame.height/scale
                imgView.frame.size = CGSize(width: newWidth, height: newHeight)
            } else {
                
            }
        }
    }


}

