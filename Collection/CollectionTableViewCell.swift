//
//  CollectionTableViewCell.swift
//  Collection
//
//  Created by Aun Ja' on 23/4/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit

class CollectionTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var collectionImage: UIImageView!
    @IBOutlet weak var ownerLbl: UILabel!
    @IBOutlet weak var viewLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setData(collection:Collection){
        titleLbl.text=collection.title
        collectionImage.image = collection.imageName
        ownerLbl.text = "Create by :" + collection.owner
        viewLbl.text = "View :" + String(collection.view)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
