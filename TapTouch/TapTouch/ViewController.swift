//
//  ViewController.swift
//  TapTouch
//
//  Created by byunhyeongwon on 2017. 7. 16..
//  Copyright © 2017년 Joshua HyeongwonByun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtMessage: UILabel!
    @IBOutlet weak var txtTapsLevel: UILabel!
    @IBOutlet weak var txtTouchsLevel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { // 터치가 시작될 때 호출
        
        let touch = touches.first! as UITouch;
        
        txtMessage.text = "Touches Began";
        txtTapsLevel.text = String(touch.tapCount);
        txtTouchsLevel.text = String(touches.count);
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) { // 터치된 손가락이 움직였을 때 호출
        
        let touch = touches.first! as UITouch;
        
        txtMessage.text = "Touches Moved";
        txtTapsLevel.text = String(touch.tapCount);
        txtTouchsLevel.text = String(touches.count);

    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) { // 화면에서 손가락을 떼었을 때 호출
        
        let touch = touches.first! as UITouch;
        
        txtMessage.text = "Touches Ended";
        txtTapsLevel.text = String(touch.tapCount);
        txtTouchsLevel.text = String(touches.count);

    }


}

