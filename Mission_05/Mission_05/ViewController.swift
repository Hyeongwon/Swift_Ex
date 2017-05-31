//
//  ViewController.swift
//  Mission_05
//
//  Created by byunhyeongwon on 2017. 5. 31..
//  Copyright © 2017년 Joshua HyeongwonByun. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate {
    
    let MAX_ARRAY_NUM = 8;
    let PICKER_VIEW_COLUMN = 2;
    let PICKER_VIEW_HEIGHT:CGFloat = 80;
    var imageArray = [UIImage?]();
    var imageFileName = ["IMG_0001.jpg", "IMG_0002.jpg", "IMG_0003.jpg", "IMG_0004.jpg",
                         "IMG_0005.jpg", "IMG_0006.jpg", "IMG_0007.jpg", "IMG_0008.jpg"]

    @IBOutlet weak var pickerImage: UIPickerView!
    @IBOutlet weak var lblImageFileName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for i in 0 ..< MAX_ARRAY_NUM {
            
            let image = UIImage(named: imageFileName[i]);
            imageArray.append(image);
        }
        
        lblImageFileName.text = imageFileName[0];
        imageView.image = imageArray[0];
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(_ pickerView: UIPickerView!) -> Int {
       
        return PICKER_VIEW_COLUMN
    }

    
    public func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        
        return PICKER_VIEW_HEIGHT;
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return imageFileName.count;
    }
    
    public func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let imageView = UIImageView(image: imageArray[row]);
        imageView.frame = CGRect(x : 0, y: 0, width: 100, height: 150);
        
        return imageView;
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(component);
        
        if(component == 0) {
            lblImageFileName.text = imageFileName[row];
        } else {
            imageView.image = imageArray[row];
        }
        
    }
    
    


}

