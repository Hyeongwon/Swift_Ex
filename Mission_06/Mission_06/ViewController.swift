//
//  ViewController.swift
//  Mission_06
//
//  Created by byunhyeongwon on 2017. 6. 1..
//  Copyright © 2017년 Joshua HyeongwonByun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let timeSelector: Selector = #selector(ViewController.updateTime);
    let interval = 1.0;
    var alarmTime : String = "";
    var count = 10;
    
    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblSelectTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        
        let datePickerView = sender;
        
        let formatter = DateFormatter();
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE";
        lblSelectTime.text =
            "선택시간 : " + formatter.string(from: datePickerView.date);
        
        formatter.dateFormat = "hh:mm aaa";
        alarmTime = formatter.string(from: datePickerView.date);
    }
    
    func updateTime() {
        
        let date = NSDate()
        
        let formatter = DateFormatter();
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE";
        lblCurrentTime.text = "현재시간 : " + formatter.string(from: date as Date);
        
        formatter.dateFormat = "hh:mm aaa";
        let currentTime = formatter.string(from: date as Date);
        
        if(alarmTime == currentTime && count == 10) {
            
            let TimeAlert = UIAlertController(title: "알림", message: "설정된 시간입니다 !!!", preferredStyle: UIAlertControllerStyle.alert);
            
            let TimeAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertActionStyle.default, handler: {Action in self.count = 0});
            
            TimeAlert.addAction(TimeAction);
            present(TimeAlert, animated: true, completion: nil);
        }
        
        count += 1;
        
        if(count > 10) {
            count = 10;
        }
        
    }


}

