//
//  LoginViewController.swift
//  Collection
//
//  Created by Aun Ja' on 27/4/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {


    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var pass: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        ManageFire.instance.retrieve()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Login(_ sender: Any) {
        if CheckInternet.Connection(){
            if  ManageFire.instance.checkLogin(emailL: email.text!, passL: pass.text!) {
                performSegue(withIdentifier: "singIn", sender: nil)
            }
        }
        else {
            self.Alert(Message:"Please connecting internet!!!")
        }
    }
    
    func Alert(Message:String){
        let alert = UIAlertController(title: "Error", message: Message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert,animated:true, completion: nil)
    }
    
    @IBAction func Register(_ sender: Any) {
       performSegue(withIdentifier: "goRegister", sender: nil)
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
