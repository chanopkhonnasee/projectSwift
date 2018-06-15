//
//  ManageData.swift
//  Collection
//
//  Created by Aun Ja' on 24/4/18.
//  Copyright © 2018 test. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseStorage
import UIKit

class ManageData {
    
    var ref:DatabaseReference?
    var imageRef: StorageReference?
    static let instance = ManageData()
    
    let COLLECTION_KEY = "collection"
    
    public var _collection = [Collection]()
    
    var collection: [Collection]{
        return _collection
    }
    /*
    func loadDreanList(){
        if let collectionData = UserDefaults.standard.object(forKey: COLLECTION_KEY) as? Data{
            if let collectionArray = NSKeyedUnarchiver.unarchiveObject(with: collectionData){
                _collection = collectionArray
            }
        }
    }
    
    func save_collection(){
        let collectionData = NSKeyedArchiver.archivedData(withRootObject: _collection)
        UserDefaults.standard.set(collectionData, forKey: COLLECTION_KEY)
        UserDefaults.standard.synchronize()
    }
    */
    
    func add_collectionToArray(collection:Collection) -> Bool{
        for post in _collection {
            if collection.id == post.id {
                return false
            }
        }
        _collection.append(collection)
        return true
    }
    
    
   /* func GetImageFromFile(_ imgName: String) -> Any {
        let imgPath = fileInDocumentDirectory(fileName:imgName)
    }
    
    func fileInDocumentDirectory(fileName: String) -> String {
        let documentUrl = FileManager.default.URLsForDirectory(.DocumentDirectory,inDomains: .userDomainMask)[0]
        let fileUrl = documentUrl.URLByAppendingPathComponent(fileName)
    }
 */
    
    
    
    
    
    
    
    
    
}
