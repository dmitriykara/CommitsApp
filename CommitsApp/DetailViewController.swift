//
//  DetailViewController.swift
//  CommitsApp
//
//  Created by Dmitriy Kara on 28.11.2020.
//

import UIKit

class DetailViewController: UIViewController {

    var detailItem: Commit?

    @IBOutlet weak var detailLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let detail = self.detailItem {
            detailLabel.text = detail.message
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Commit1/\(detail.author.commits.count)", style: .plain, target: self, action: #selector(showAuthorCommits))
        }
    }

    @objc func showAuthorCommits() {
        guard
            let commit = detailItem,
            let commits = commit.author.commits.allObjects as? [Commit]
        else {
            return
        }

        if let vc = storyboard?.instantiateViewController(withIdentifier: "Author") as? AuthorCommitsTableViewController {
            vc.commits = commits
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
