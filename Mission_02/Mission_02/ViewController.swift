//
//  ViewController.swift
//  Mission_02
//
//  Created by byunhyeongwon on 2017. 5. 30..
//  Copyright © 2017년 Joshua HyeongwonByun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let timeSelector : Selector = #selector(ViewController.updateTime);
    let interval = 1.0;
    var count = 0;
    var alarmTime : String = "";
    
    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblSelectTime: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true);

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        
        let datePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        
        lblSelectTime.text =
            "선택 시간 : " + formatter.string(from: datePickerView.date)
        
        formatter.dateFormat = "hh:mm aaa"
        alarmTime = formatter.string(from: datePickerView.date);
    }
    
    func updateTime() {
        
        /*
        lblCurrentTime.text = String(count);
        
        */
        
        count = count + 1;
        let date = NSDate();
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE";
        
        lblCurrentTime.text =
            "현재 시간 : " + formatter.string(from: date as Date);
        
        formatter.dateFormat = "hh:mm aaa";
        let currentTime = formatter.string(from: date as Date);
        
        /*
        if(alarmTime == currentTime) {
            view.backgroundColor = UIColor.red;
        }
        
        if(count == 10) {
            view.backgroundColor = UIColor.white;
        }
        */
    }

}

