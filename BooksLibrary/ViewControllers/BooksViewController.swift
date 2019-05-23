//
//  BooksViewController.swift
//  BooksLibrary
//
//  Created by Gourav  Garg on 23/05/19.
//  Copyright © 2019 Gourav  Garg. All rights reserved.
//

import UIKit
import SDWebImage

class BookCell: UITableViewCell {
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var bookGenre: UILabel!
}

class BooksViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var books: Books?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension BooksViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "book") as? BookCell else {
            return UITableViewCell()
        }
        if let _books = books {
            cell.bookAuthor.text = _books[indexPath.row].author_name
            cell.bookTitle.text = _books[indexPath.row].book_title
            cell.imageView?.sd_setImage(with: URL(string: (books?[indexPath.row].image_url!)!), placeholderImage: UIImage(named: "placeholder.png"))
            return cell
        } else {
             return UITableViewCell()
        }
    }
}

