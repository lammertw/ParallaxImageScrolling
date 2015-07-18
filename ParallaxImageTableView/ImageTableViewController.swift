//
//  ImageTableViewController.swift
//  ParallaxImageTableView
//
//  Created by Lammert Westerhoff on 17/07/15.
//  Copyright (c) 2015 Xebia. All rights reserved.
//

import UIKit

class ImageTableViewController: UITableViewController {

    weak var imageCenterYConstraint: NSLayoutConstraint?

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

        if let imageCell = cell as? ImageCell {
            imageCenterYConstraint = imageCell.imageCenterYConstraint
        }

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

    // MARK: - Scroll view delegate

    override func scrollViewDidScroll(scrollView: UIScrollView) {
        imageCenterYConstraint?.constant = min(0, -scrollView.contentOffset.y / 2.0)
    }

}

class ImageCell: UITableViewCell {

    @IBOutlet weak var imageCenterYConstraint: NSLayoutConstraint!
}
