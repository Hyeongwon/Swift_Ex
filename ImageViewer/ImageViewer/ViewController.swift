//
//  ViewController.swift
//  ImageViewer
//
//  Created by byunhyeongwon on 2017. 5. 27..
//  Copyright © 2017년 Joshua HyeongwonByun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var imageName = ["Cosmos01.jpg", "Cosmos02.jpg", "Cosmos03.jpg"]
    var state = 0
    var img : UIImage?
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imageView.image = UIImage(named: imageName[state])
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func prevBtn(_ sender: UIButton) {
        
        state += 1
        
        if(state == 3) {
            
            state = 0;
        }
            
        imageView.image = UIImage(named: imageName[state])
        
    }
    
    @IBAction func nextBtn(_ sender: UIButton) {
        
        state -= 1
        
        if(state == -1) {
            
            state = 2;
        }
        
        imageView.image = UIImage(named: imageName[state])
        
    }
    

}

