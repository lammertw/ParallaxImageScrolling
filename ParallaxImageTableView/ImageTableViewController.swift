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

    // MARK: - Scroll view delegate

    override func scrollViewDidScroll(scrollView: UIScrollView) {
        if let imageCell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0)) as? ImageCell {
            imageCell.scrollViewDidScroll(scrollView)
        }    }

}

class ImageCell: UITableViewCell {

    @IBOutlet weak var bottomSpaceConstraint: NSLayoutConstraint!
    @IBOutlet weak var topSpaceConstraint: NSLayoutConstraint!
    @IBOutlet weak var containerView: UIView!

    func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView.contentOffset.y >= 0 {
            // scrolling up
            containerView.clipsToBounds = true
            bottomSpaceConstraint?.constant = -scrollView.contentOffset.y / 2
            topSpaceConstraint?.constant = scrollView.contentOffset.y / 2
        } else {
            // scrolling down
            topSpaceConstraint?.constant = scrollView.contentOffset.y
            containerView.clipsToBounds = false
        }
    }
}
