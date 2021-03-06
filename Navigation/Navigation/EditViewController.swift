//
//  EditViewController.swift
//  Navigation
//
//  Created by byunhyeongwon on 2017. 6. 5..
//  Copyright © 2017년 Joshua HyeongwonByun. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

    var textWayValue: String = "";
    var textMessage: String = "";
    var isOn = false;
    var isZoom = false;
    
    var delegate: EditDelegate?;
    
    @IBOutlet weak var lblWay: UILabel!
    @IBOutlet weak var txtMessage: UITextField!
    @IBOutlet weak var swIsOn: UISwitch!
    @IBOutlet weak var btnResize: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        lblWay.text = textWayValue;
        txtMessage.text = textMessage;
        
        swIsOn.isOn = isOn;
        if isZoom {
            btnResize.setTitle("확대", for: UIControlState())
        } else {
            btnResize.setTitle("축소", for: UIControlState())
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        
        if delegate != nil {
            delegate?.didMessageEditDone(self, message: txtMessage.text!);
            delegate?.didImageOnOffDone(self, isOn: isOn);
            delegate?.didImageZoomDone(self, isZoom: isZoom);
        }
        
        _ = navigationController?.popViewController(animated: true);
    }
    
    @IBAction func swImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            
            isOn = true;
            
        } else {
            
            isOn = false;
            
        }
    }
    @IBAction func btnResizeImage(_ sender: UIButton) {
        
        if (isZoom) {
            
            btnResize.setTitle("확대", for: .normal);
            
            
        } else {
            
            btnResize.setTitle("축소", for: .normal);
            
        }
        
        isZoom = !isZoom;
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
