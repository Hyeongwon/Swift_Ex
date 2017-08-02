//
//  ViewController.swift
//  Mission_18
//
//  Created by byunhyeongwon on 2017. 8. 2..
//  Copyright © 2017년 Joshua HyeongwonByun. All rights reserved.
//

import UIKit

var images = ["01.png", "02.png", "03.png", "04.png", "05.png", "06.png"];

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    var cnt = 0;
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pageControl.numberOfPages = images.count;
        pageControl.currentPage = 0;
        imgView.image = UIImage(named: images[0]);
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left;
        self.view.addGestureRecognizer(swipeLeft);
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right;
        self.view.addGestureRecognizer(swipeRight);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pageChange(_ sender: UIPageControl) {
        
        imgView.image = UIImage(named: images[pageControl.currentPage]);
    }
    
    func respondToSwipeGesture(_ gesture: UISwipeGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
           
            case UISwipeGestureRecognizerDirection.left:
                pageControl.currentPage += 1;
                cnt += 1;
                if cnt == images.count {
                    pageControl.currentPage = 0;
                    cnt = 0;
                }
                print(pageControl.currentPage, cnt);
                
            case UISwipeGestureRecognizerDirection.right:
                pageControl.currentPage -= 1;
                cnt -= 1;
                if cnt == -1 {
                    pageControl.currentPage = images.count - 1;
                    cnt = images.count - 1;
                }
                print(pageControl.currentPage, cnt);
            /*
            case UISwipeGestureRecognizerDirection.left:
                if (pageControl.currentPage<pageControl.numberOfPages-1) {
                    pageControl.currentPage = pageControl.currentPage + 1
                }
                print("Swiped Left")
            case UISwipeGestureRecognizerDirection.right:
                if (pageControl.currentPage>0) {
                    pageControl.currentPage = pageControl.currentPage - 1
                }
                print("Swiped Right")
            */
                
            default:
                break;
            }
            imgView.image = UIImage(named: images[pageControl.currentPage])
        }
        
    }

}

