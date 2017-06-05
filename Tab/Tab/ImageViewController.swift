//
//  ViewController.swift
//  ImageView
//
//  Created by byunhyeongwon on 2017. 5. 27..
//  Copyright © 2017년 Joshua HyeongwonByun. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    var isZoom = false
    var imgOn : UIImage?
    var imgOff : UIImage?

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var btnResize: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imgOn = UIImage(named: "OnLamp.png")
        imgOff = UIImage(named: "OffLamp.png")
        
        imgView.image = imgOn
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnResizeImage(_ sender: UIButton) {
        
        let scale: CGFloat = 2.0
        var newWidth: CGFloat, newHeight: CGFloat
        
        if(isZoom) { // true
            
            newWidth = imgView.frame.width/scale
            newHeight = imgView.frame.height/scale
            imgView.frame.size = CGSize(width: newWidth, height: newHeight)
            btnResize.setTitle("확대", for: .normal)
            
            
        } else { // false
            
            newWidth = imgView.frame.width*scale
            newHeight = imgView.frame.height*scale
            imgView.frame.size = CGSize(width: newWidth, height: newHeight)
            //print(newHeight)
            //print(newWidth)
            btnResize.setTitle("축소", for: .normal)
            
        }
        isZoom = !isZoom
    }

    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        
        if sender.isOn {
            
            imgView.image = imgOn
            
        } else {
            
            imgView.image = imgOff
        }
    }
}

