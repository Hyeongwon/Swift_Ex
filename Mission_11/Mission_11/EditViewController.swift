//
//  EditViewController.swift
//  Mission_11
//
//  Created by byunhyeongwon on 2017. 6. 7..
//  Copyright © 2017년 Joshua HyeongwonByun. All rights reserved.
//

import UIKit

protocol EditDelegate {
    
    func didMessageEditDone(_ controller: EditViewController, message: String);
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool);
}

class EditViewController: UIViewController {
    
    var textWayValue: String = "";
    var textMessage: String = "";
    var delegate : EditDelegate?;
    
    var isOn = false;

    @IBOutlet weak var swIsOn: UISwitch!
    @IBOutlet weak var lblWay: UILabel!
    @IBOutlet weak var txMessage: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblWay.text = textWayValue;
        txMessage.text = textMessage;
        swIsOn.isOn = isOn;
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btndone(_ sender: UIButton) {
        
        if delegate != nil {
            delegate?.didMessageEditDone(self, message: txMessage.text!);
            delegate?.didImageOnOffDone(self, isOn: isOn);
        }
        //_ = navigationController?.popViewController(animated: true);
        
    }
    @IBAction func swIsOn(_ sender: UISwitch) {
        
        if sender.isOn {
            
            isOn = true;
            
        } else {
            
            isOn = false;
            
        }
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
