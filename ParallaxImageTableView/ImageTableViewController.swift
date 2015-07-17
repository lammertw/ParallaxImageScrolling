//
//  ImageTableViewController.swift
//  ParallaxImageTableView
//
//  Created by Lammert Westerhoff on 17/07/15.
//  Copyright (c) 2015 Xebia. All rights reserved.
//

import UIKit

class ImageTableViewController: UITableViewController {

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cellIdentifier = ""
        switch indexPath.section {
        case 0:
            cellIdentifier = "ImageCell"
        case 1:
            cellIdentifier = "TextCell"
        default: ()
        }

        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! UITableViewCell

        return cell
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return UITableViewAutomaticDimension
        default: ()
            return 50
        }
    }

    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 200
        default: ()
            return 50
        }
    }

}
