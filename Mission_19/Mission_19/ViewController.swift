//
//  ViewController.swift
//  Mission_19
//
//  Created by byunhyeongwon on 2017. 8. 5..
//  Copyright © 2017년 Joshua HyeongwonByun. All rights reserved.
//

import UIKit

var images = ["01.png", "02.png", "03.png", "04.png", "05.png", "06.png",];

class ViewController: UIViewController {

    @IBOutlet weak var imgview: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var cnt = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pageControl.numberOfPages = images.count;
        pageControl.currentPage = 0;
        
        imgview.image = UIImage(named: images[0]);
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft);
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight);
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector (ViewController.doPinch(_:)))
        self.view.addGestureRecognizer(pinch);

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    @IBAction func pageChanged(_ sender: UIPageControl) {
        
        imgview.image = UIImage(named: images[pageControl.currentPage]);
    }
    
    func respondToSwipeGesture(_ gesture: UIGestureRecognizer) {
        
        if let swipeGesute = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesute.direction {
            
            case UISwipeGestureRecognizerDirection.left:
                pageControl.currentPage += 1;
                cnt += 1;
                
                if(cnt == 6) {
                    
                    pageControl.currentPage = 0;
                    cnt = pageControl.currentPage;
                }
                
            case UISwipeGestureRecognizerDirection.right:
                pageControl.currentPage -= 1;
                cnt -= 1;
                
                if(cnt == -1) {
                    
                    pageControl.currentPage = images.count - 1;
                    cnt = pageControl.currentPage;
                }
                
            default:
                break;
                
            }
            imgview.image = UIImage(named: images[pageControl.currentPage]);
        }
    }
    
    func doPinch(_ pinch: UIPinchGestureRecognizer) {
        
        imgview.transform = imgview.transform.scaledBy(x: pinch.scale, y: pinch.scale);
        
        pinch.scale = 1;
    }


}

