//
//  CollectionViewController.swift
//  Collection
//
//  Created by Aun Ja' on 24/4/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController , UITableViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var titleTxt: UITextView!
    @IBOutlet weak var detailTxt: UITextView!
    @IBOutlet weak var collectionImg: UIImageView!
    
    
    var pickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backToHome(_ sender: Any) {
        performSegue(withIdentifier: "goHome", sender: nil)
    }
    
    @IBAction func SelectPhotoClicked(_ sender: UIButton) {
        let imageController = UIImagePickerController()
        imageController.delegate = self
        imageController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(imageController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        collectionImg.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func SaveClicked(_ sender: Any) {
        if let strTitle = titleTxt.text , let strDetail = detailTxt.text ,let strImage = collectionImg.image{
            ManageFire.instance.addPost(title: strTitle, detail: strDetail, image: strImage)
        }
            //performSegue(withIdentifier: "goHome", sender: nil)
            performSegue(withIdentifier: "loading", sender: nil)
    }
    
}


