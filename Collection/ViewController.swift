//
//  ViewController.swift
//  Collection
//
//  Created by Aun Ja' on 23/4/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    static let instance = ViewController()
    
    var ref:DatabaseReference?
    var imageRef: StorageReference?
    var databaseHandle:DatabaseHandle?

    @IBOutlet weak var tableView: UITableView!
    
    //var collection = [Collection]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate=self
        tableView.dataSource=self
    
        //ManageFire.instance.retrieve()
        self.tableView.reloadData()
    }
    

    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ManageData.instance.collection.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let celH = tableView.frame.width + 150
        return celH
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let collectionitem = ManageData.instance.collection[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionTableViewCell") as? CollectionTableViewCell{
        cell.setData(collection: collectionitem)
        return cell
        }
        else {
            let cell = CollectionTableViewCell()
            cell.setData(collection: collectionitem)
            return cell
        }
     
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let collectionitem = ManageData.instance.collection[indexPath.row]
            ManageData.instance.collection[indexPath.row].visit()
        ManageFire.instance.increaseView(collection :ManageData.instance.collection[indexPath.row])
        performSegue(withIdentifier: "gotoDetail", sender: collectionitem)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoDetail" {
            if let Detail = segue.destination as? DetailViewController {
                if let tmp = sender as? Collection {
                    Detail.collection = tmp
                }
            }
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

