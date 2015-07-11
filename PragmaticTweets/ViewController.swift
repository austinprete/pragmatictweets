//
//  ViewController.swift
//  PragmaticTweets
//
//  Created by Austin Prete on 7/9/15.
//  Copyright (c) 2015 Austin Prete. All rights reserved.
//

import UIKit
import Social
import Accounts

let defaultAvatarURL = NSURL(string: "https://abs.twimg.com/sticky/default_profile_images/default_profile_0_200x200.png")

public class ViewController: UITableViewController {
    
    var parsedTweets : Array<ParsedTweet> = [
        ParsedTweet(tweetText: "iOS 8 SDK Development now in print. Swift programming FTW!", userName: "@pragprog", createdAt: "2014-08-20 16:44:30 EDT", userAvatarURL: defaultAvatarURL),
        
        ParsedTweet(tweetText: "math is cool", userName: "@redqueencoder", createdAt: "2014-08-16 16:44:30 EDT", userAvatarURL: defaultAvatarURL),
        
        ParsedTweet(tweetText: "Anime is cool", userName: "@invalidname", createdAt: "2014-07-31 16:44:30 EDT", userAvatarURL: defaultAvatarURL),
    ]

    override public func viewDidLoad() {
        super.viewDidLoad()
        reloadTweets()
        var refresher = UIRefreshControl()
        refresher.addTarget(self, action: "handleRefresh:", forControlEvents: UIControlEvents.ValueChanged)
        refreshControl = refresher
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func handleRefresh(sender : AnyObject?) {
        parsedTweets.append(ParsedTweet(tweetText: "New row", userName: "@refresh", createdAt: NSDate().description, userAvatarURL: defaultAvatarURL))
        reloadTweets()
        refreshControl!.endRefreshing()
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parsedTweets.count
    }
    
    func reloadTweets() {
        let accountStore = ACAccountStore()
        let twitterAccountType = accountStore.accountTypeWithAccountTypeIdentifier(ACAccountTypeIdentifierTwitter)
        accountStore.requestAccessToAccountsWithType(twitterAccountType, options: nil, completion: {
            (granted: Bool, error: NSError!) -> Void in
            if (!granted) {
                println ("account access not granted")
            } else {
                let twitterAccounts = accountStore.accountsWithAccountType(twitterAccountType)
                if twitterAccounts.count == 0 {
                    println("no twitter accounts configured")
                    return
                } else {
                    
                }
            }
        })
        tableView.reloadData()
    }
    
    override public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CustomTweetCell") as! ParsedTweetCell
        let parsedTweet = parsedTweets[indexPath.row]
        cell.userNameLabel?.text = parsedTweet.userName
        cell.tweetTextLabel?.text = parsedTweet.tweetText
        cell.createdAtLabel.text = parsedTweet.createdAt
        if parsedTweet.userAvatarURL != nil {
            if let imageData = NSData(contentsOfURL: parsedTweet.userAvatarURL!) {
                cell.avatarImageView.image = UIImage(data: imageData)
            }
        }
        return cell
    }
}

