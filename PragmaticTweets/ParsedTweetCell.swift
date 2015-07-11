//
//  ParsedTweetCell.swift
//  PragmaticTweets
//
//  Created by Austin Prete on 7/10/15.
//  Copyright (c) 2015 Austin Prete. All rights reserved.
//

import UIKit

class ParsedTweetCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
