//
//  Collection.swift
//  Collection
//
//  Created by Aun Ja' on 23/4/18.
//  Copyright © 2018 test. All rights reserved.
//

import Foundation
import UIKit

class User{
    private var _id:String!
    private var _name:String!
    private var _email:String!
    
    var id:String{
        return _id
    }
    var name:String{
        return _name
    }
    var email:String{
        return _email
    }
    
    init (id:String,email:String,name:String){
        self._id=id
        self._email=email
        self._name=name
    }
    
}
