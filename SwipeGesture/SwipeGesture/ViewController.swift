//
//  ViewController.swift
//  SwipeGesture
//
//  Created by byunhyeongwon on 2017. 7. 20..
//  Copyright © 2017년 Joshua HyeongwonByun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let numOfTouches = 2;
    
    @IBOutlet weak var imgViewUp: UIImageView!
    @IBOutlet weak var imgViewRight: UIImageView!
    @IBOutlet weak var imgViewDown: UIImageView!
    @IBOutlet weak var imgViewLeft: UIImageView!
    
    var imgLeft = [UIImage]();
    var imgRight = [UIImage]();
    var imgDown = [UIImage]();
    var imgUp = [UIImage]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imgLeft.append(UIImage(named: "arrow-left-black.png")!);
        imgLeft.append(UIImage(named: "arrow-left-red.png")!);
        imgLeft.append(UIImage(named: "arrow-left-green.png")!);
        
        imgRight.append(UIImage(named: "arrow-right-black.png")!);
        imgRight.append(UIImage(named: "arrow-right-red.png")!);
        imgRight.append(UIImage(named: "arrow-right-green.png")!);
        
        imgDown.append(UIImage(named: "arrow-down-black.png")!);
        imgDown.append(UIImage(named: "arrow-down-red.png")!);
        imgDown.append(UIImage(named: "arrow-down-green.png")!);
        
        imgUp.append(UIImage(named: "arrow-up-black.png")!);
        imgUp.append(UIImage(named: "arrow-up-red.png")!);
        imgUp.append(UIImage(named: "arrow-up-green.png")!);
        
        imgViewUp.image = imgUp[0];
        imgViewDown.image = imgDown[0];
        imgViewRight.image = imgRight[0];
        imgViewLeft.image = imgLeft[0];
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGsture(_:)))
        swipeUp.direction = UISwipeGestureRecognizerDirection.up
        //swipeUp.numberOfTouchesRequired = numOfTouches;
        self.view.addGestureRecognizer(swipeUp);
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGsture(_:)))
        swipeDown.direction = UISwipeGestureRecognizerDirection.down
        //swipeDown.numberOfTouchesRequired = numOfTouches;
        self.view.addGestureRecognizer(swipeDown);
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGsture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        //swipeLeft.numberOfTouchesRequired = numOfTouches;
        self.view.addGestureRecognizer(swipeLeft);
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGsture(_:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        //swipeRight.numberOfTouchesRequired = numOfTouches;
        self.view.addGestureRecognizer(swipeRight);
        
        let swipeUpMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respndToSwipeGestureMiti(_:)))
        swipeUpMulti.direction = UISwipeGestureRecognizerDirection.up;
        swipeUpMulti.numberOfTouchesRequired = numOfTouches;
        self.view.addGestureRecognizer(swipeUpMulti);
        
        let swipeDownMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respndToSwipeGestureMiti(_:)))
        swipeDownMulti.direction = UISwipeGestureRecognizerDirection.down;
        swipeDownMulti.numberOfTouchesRequired = numOfTouches;
        self.view.addGestureRecognizer(swipeDownMulti);
        
        let swipeLeftMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respndToSwipeGestureMiti(_:)))
        swipeLeftMulti.direction = UISwipeGestureRecognizerDirection.left;
        swipeLeftMulti.numberOfTouchesRequired = numOfTouches;
        self.view.addGestureRecognizer(swipeLeftMulti);
        
        let swipeRightMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respndToSwipeGestureMiti(_:)))
        swipeRightMulti.direction = UISwipeGestureRecognizerDirection.right;
        swipeRightMulti.numberOfTouchesRequired = numOfTouches;
        self.view.addGestureRecognizer(swipeRightMulti);
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func respondToSwipeGsture(_ Gesture: UIGestureRecognizer) {
        
        if let swipeGesture = Gesture as? UISwipeGestureRecognizer {
            
            imgViewUp.image = imgUp[0];
            imgViewDown.image = imgDown[0];
            imgViewRight.image = imgRight[0];
            imgViewLeft.image = imgLeft[0];
            
            switch swipeGesture.direction {
                
                case UISwipeGestureRecognizerDirection.up:
                    imgViewUp.image = imgUp[1];
                
                case UISwipeGestureRecognizerDirection.down:
                    imgViewDown.image = imgDown[1];
                
                case UISwipeGestureRecognizerDirection.left:
                    imgViewLeft.image = imgLeft[1];
                
                case UISwipeGestureRecognizerDirection.right:
                    imgViewRight.image = imgRight[1];
                
                default:
                    break;
            }
        }
    }
    
    func respndToSwipeGestureMiti(_ gesture: UIGestureRecognizer) {
        
        if let swipeGsture = gesture as? UISwipeGestureRecognizer {
            
            imgViewUp.image = imgUp[0];
            imgViewDown.image = imgDown[0];
            imgViewLeft.image = imgLeft[0];
            imgViewRight.image = imgRight[0];
            
            switch swipeGsture.direction {
                
                case UISwipeGestureRecognizerDirection.up:
                    imgViewUp.image = imgUp[2];
                
                case UISwipeGestureRecognizerDirection.down:
                    imgViewDown.image = imgDown[2];
    
                case UISwipeGestureRecognizerDirection.left:
                    imgViewLeft.image = imgLeft[2];
                
                case UISwipeGestureRecognizerDirection.right:
                    imgViewRight.image = imgRight[2];
                
                default:
                    break;
            }
            
        }
    }


}

