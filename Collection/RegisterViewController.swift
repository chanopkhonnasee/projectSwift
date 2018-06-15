//
//  RegisterViewController.swift
//  Collection
//
//  Created by Aun Ja' on 27/4/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var passText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backlogin(_ sender: Any) {
        performSegue(withIdentifier: "backtologin", sender: nil)
    }
    
    @IBAction func register(_ sender: Any) {
        ManageFire.instance.addUser(email: emailText.text!, pass: passText.text!, name: nameText.text!)
        if ManageFire.statusR == true{
            performSegue(withIdentifier: "backtologin", sender: nil)
        }else{
            self.Alert(Message: "this email is used",Title: "Error")
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
    func Alert(Message:String,Title:String){
        let alert = UIAlertController(title: Title, message: Message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert,animated:true, completion: nil)
    }
}
