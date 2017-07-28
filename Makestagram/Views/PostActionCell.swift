//
//  PostActionCell.swift
//  Makestagram
//
//  Created by Selim Ben Lamine on 7/27/17.
//  Copyright © 2017 Selim Ben Lamine. All rights reserved.
//

import UIKit

class PostActionCell: UITableViewCell {
    
    static let height: CGFloat = 46

    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var timeAgoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func likeButtonTapped(_ sender: Any) {
        print("Like button tapped")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
