//
//  Collection.swift
//  Collection
//
//  Created by Aun Ja' on 23/4/18.
//  Copyright © 2018 test. All rights reserved.
//

import Foundation
import UIKit

class Collection{
    private var _id:String!
    private var _title:String!
    private var _detail:String!
    private var _imageName:UIImage!
    private var _url:String!
    private var _view:Int!=0
    private var _owner:String!
    
    var id:String{
        return _id
    }
    var title:String{
        return _title
    }
    var detail:String{
        return _detail
    }
    var imageName:UIImage{
        return _imageName
    }
    var url:String{
        return _url
    }
    var view:Int{
        return _view
    }
    var owner:String{
        return _owner
    }
    
    init (id:String,title:String,detail:String,imageName:UIImage,url:String,view:Int,owner:String){
        self._id=id
        self._title=title
        self._detail=detail
        self._imageName=imageName
        self._url=url
        self._view=view
        self._owner=owner
    }
    
    func visit() {
        _view = _view + 1
    }
    
}
