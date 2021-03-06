//
//  ViewController.swift
//  PickerView
//
//  Created by byunhyeongwon on 2017. 5. 30..
//  Copyright © 2017년 Joshua HyeongwonByun. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDelegate {
    
    let MAX_ARRAY_NUM = 9;
    let PICKER_VIEW_COLUMN = 1;
    let PICKER_VIEW_HEIGHT:CGFloat = 80
    var imageFileName = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg",
                         "6.jpg", "7.jpg", "8.jpg", "9.jpg"]
    
    var imageArray = [UIImage]();

    @IBOutlet weak var pickerImage: UIPickerView!
    @IBOutlet weak var lblImageFileName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for i in 0 ..< MAX_ARRAY_NUM {
            
            let image = UIImage(named: imageFileName[i]);
            imageArray.append(image!);
        }
        
        lblImageFileName.text = imageFileName[0];
        imageView.image = imageArray[0];
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return imageFileName.count;
    }
    
    /*
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return imageFileName[row]
    }*/
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        lblImageFileName.text = imageFileName[row];
        imageView.image = imageArray[row];
    }
    
    public func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let imageView = UIImageView(image: imageArray[row])
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 150)
        
        return imageView;
    
    }
    
    public func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        
        return PICKER_VIEW_HEIGHT;
    }

}

