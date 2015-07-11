//
//  ParsedTweet.swift
//  PragmaticTweets
//
//  Created by Austin Prete on 7/10/15.
//  Copyright (c) 2015 Austin Prete. All rights reserved.
//

import UIKit

class ParsedTweet: NSObject {
    var tweetText : String?
    var userName : String?
    var createdAt: String?
    var userAvatarURL : NSURL?
    
    init(tweetText: String?, userName: String?, createdAt: String?, userAvatarURL: NSURL?) {
        super.init()
        self.tweetText = tweetText
        self.userName = userName
        self.createdAt = createdAt
        self.userAvatarURL = userAvatarURL
    }
    
    override init() {
        super.init()
    }
}
