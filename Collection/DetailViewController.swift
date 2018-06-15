//
//  DetailViewController.swift
//  Collection
//
//  Created by Aun Ja' on 26/4/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var collection:Collection!

    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var detail: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imgView.image = collection.imageName
        detail.text = collection.detail
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
