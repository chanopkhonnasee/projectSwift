//
//  manageFire.swift
//  Collection
//
//  Created by Aun Ja' on 27/4/18.
//  Copyright © 2018 test. All rights reserved.
//
import UIKit
import Foundation
import FirebaseDatabase
import FirebaseStorage

class ManageFire {
    static let instance = ManageFire()
    var ref:DatabaseReference?
    var imageRef: StorageReference?
    var databaseHandle:DatabaseHandle?
    var values:NSDictionary?
    var user:User?
    static var status:Bool = false
    static var statusR:Bool = true
    func retrieve() {
        ref = Database.database().reference()
        databaseHandle = ref?.child("Posts").observe(.childAdded, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            let id = value?["id"] as? String ?? ""
            let title = value?["title"] as? String ?? ""
            let detail = value?["detail"] as? String ?? ""
            let url = value?["url"] as? String ?? ""
            let view = value?["view"] as? String ?? ""
            let owner = value?["owner"] as? String ?? ""
            let imageRef = Storage.storage().reference(forURL: url)
            imageRef.getData(maxSize: 14 * 1024 * 1024, completion: { (data, error) in
               let image = UIImage(data: data!)
                let tmp = Collection(id:id,title:title,detail:detail,imageName:image!,url:url,view: Int(view)!,owner:owner)
                _ = ManageData.instance.add_collectionToArray(collection: tmp)
            })
        })

        databaseHandle = ref?.child("Users").observe(.value, with: { (snapshot) in
            self.values = snapshot.value as? NSDictionary })
    }
    
    func increaseView(collection :Collection) {
        ref = Database.database().reference()
        let post = ["id": collection.id,
                    "owner": collection.owner,
                    "title": collection.title,
                    "detail": collection.detail,
                    "view": String(collection.view),
                    "url": collection.url]
        let childUpdates = ["/Posts/\(collection.id)": post]
        ref?.updateChildValues(childUpdates)
    }
    
    func checkLogin(emailL: String,passL: String) -> Bool {
        
        ref = Database.database().reference()
       
                for (key,_) in self.values!{
                    let contact:NSObject = values![key] as! NSObject
                    let email:String! = contact.value(forKey: "email") as? String
                    let id:String! = contact.value(forKey: "id") as? String
                    let name:String! = contact.value(forKey: "name") as? String
                    let pass:String! = contact.value(forKey: "password") as? String
                    if ( emailL == email && passL == pass ) {
                        ManageFire.instance.user = User(id: id, email: email, name: name)
                        ManageFire.status = true
                        break
                    }
                    else {
                        ManageFire.status = false
                    }
                }
       
       return ManageFire.status
    }
    
    func addUser(email: String,pass: String,name: String) {
        ref = Database.database().reference()
        ManageFire.statusR = true
        for (key,_) in self.values!{
            let contact:NSObject = values![key] as! NSObject
            let emailF:String! = contact.value(forKey: "email") as? String
            if ( emailF == email ) {
                ManageFire.statusR = false
            }
        }
        if ManageFire.statusR == true {
            let user = ["id" :self.randomAlphaNumericString(length:20) ,
                               "email" :email,
                               "password" :pass,
                               "name" : name]
            ref?.child("Users").childByAutoId().setValue(user)
        }
    }
    
    func addPost(title: String,detail: String,image: UIImage){
        ref = Database.database().reference()
        imageRef = Storage.storage().reference().child("images").child(randomAlphaNumericString(length:20))
        
        guard let imageData = UIImageJPEGRepresentation(image,1) else {return}
        _ = imageRef?.putData(imageData,metadata:nil){(metadata, error) in
            let id = self.ref?.child("Posts").childByAutoId().key
            let postCollect = ["id" :id ,
                               "owner":ManageFire.instance.user?.name,
                               "title" :title,
                               "detail" :detail,
                               "view" :"0",
                               "url" :metadata?.downloadURL()?.absoluteString ]
            
            self.ref?.child("Posts").child(id!).setValue(postCollect)
        }
    }
    
    func randomAlphaNumericString(length: Int) -> String {
        let allowedChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let allowedCharsCount = UInt32(allowedChars.characters.count)
        var randomString = ""
        
        for _ in 0..<length {
            let randomNum = Int(arc4random_uniform(allowedCharsCount))
            let randomIndex = allowedChars.index(allowedChars.startIndex, offsetBy: randomNum)
            let newCharacter = allowedChars[randomIndex]
            randomString += String(newCharacter)
        }
        
        return randomString
    }
    
}
