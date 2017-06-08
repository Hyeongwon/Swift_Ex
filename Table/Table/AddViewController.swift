//
//  AddViewController.swift
//  Table
//
//  Created by byunhyeongwon on 2017. 6. 8..
//  Copyright © 2017년 Joshua HyeongwonByun. All rights reserved.
//

import UIKit

let PICKER_VIEW_COLUMN = 1;
var image_row = 0;
var imageArray = [UIImage?]();

class AddViewController: UIViewController, UIPickerViewDelegate {

    @IBOutlet weak var pickerImage: UIPickerView!
    @IBOutlet weak var tfAddItem: UITextField!
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0 ..< itemsImageFile.count  {
            
            let image = UIImage(named: itemsImageFile[i]);
            imageArray.append(image);
        }
        
        imgView.image = imageArray[0];

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnAddItem(_ sender: UIButton) {
        
        items.append(tfAddItem.text!);
        itemsImageFile.append(itemsImageFile[image_row]);
        tfAddItem.text = "";
        _ = navigationController?.popViewController(animated: true);
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return PICKER_VIEW_COLUMN;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return itemsImageFile.count;
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        imgView.image = imageArray[row];
    }
    
    public func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let imageView = UIImageView(image: imageArray[row]);
        imageView.frame = CGRect(x: 0, y:0, width: 64, height: 64);
        image_row = row;
        
        return imageView;
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
