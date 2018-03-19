//
//  RecipeDetailViewCell.swift
//  Misrecetas
//
//  Created by Jordi Carbonell on 3/3/18.
//  Copyright © 2018 Jordi Carbonell. All rights reserved.
//

import UIKit

class RecipeDetailViewCell: UITableViewCell {
    
    @IBOutlet weak var KeyLabel: UILabel!
    
    @IBOutlet weak var KeyValue: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
