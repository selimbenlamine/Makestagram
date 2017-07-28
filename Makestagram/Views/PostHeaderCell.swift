//
//  PostHeaderCell.swift
//  Makestagram
//
//  Created by Selim Ben Lamine on 7/26/17.
//  Copyright © 2017 Selim Ben Lamine. All rights reserved.
//

import UIKit

class PostHeaderCell: UITableViewCell {
    
    static let height: CGFloat = 54
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    @IBAction func optionsButtonTapped(_ sender: Any) {
        print("Options button tapped")
    }
}
