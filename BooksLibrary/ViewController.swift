//
//  ViewController.swift
//  BooksLibrary
//
//  Created by Gourav  Garg on 23/05/19.
//  Copyright © 2019 Gourav  Garg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let totalSection = 3
    let titles = [BookSection.authors, BookSection.generes, BookSection.nationalities]
    var books: Books = []
    let booksViewController = "BooksViewController"
    var booksCateogries: [String: [String]] = [:]
    var authors = Set<String>()
    var geners = Set<String>()
    var nationality = Set<String>()
    var selected: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readSampleJson()
    }
    
    //Read Sample Json and deserialize data to Books
    func readSampleJson() {
        //TODO: Read File Async on background thread
        if let path = Bundle.main.path(forResource: "sample", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                books = try JSONDecoder().decode(Books.self, from: data)
                filterSections()
                //TODO: Update UI on Main Thread
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return totalSection
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titles[section].rawValue
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case Section.Author.rawValue:
            return authors.count
        case Section.Genere.rawValue:
            return geners.count
        case Section.Nationality.rawValue:
            return nationality.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell()}
        switch indexPath.section {
        case Section.Author.rawValue:
            cell.textLabel?.text = Array(authors)[indexPath.row].capitalized
        case Section.Genere.rawValue:
            cell.textLabel?.text = Array(geners)[indexPath.row].capitalized
        case Section.Nationality.rawValue:
            cell.textLabel?.text = Array(nationality)[indexPath.row].capitalized
        default:
            return UITableViewCell()
        }
        return cell
    }
    
    func filterSections() {
        for book in books {
            if let _name = book.author_name {
                authors.insert(_name)
            }
            
            if let _geners = book.genre {
                geners.insert(_geners)
            }
            
            if let _nationality = book.author_country {
                nationality.insert(_nationality)
            }
        }
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selected = indexPath
        performSegue(withIdentifier: booksViewController, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == booksViewController {
            let booksVC = segue.destination as! BooksViewController
            var filter: String? = ""
            guard let selected = selected else {
                print("Please select category")
                return
            }
            switch selected.section {
            case Section.Author.rawValue:
                filter = Array(authors)[selected.row]
                booksVC.books = books.filter({ (book) -> Bool in
                    book.author_name == filter
                })
            case Section.Genere.rawValue:
                filter = Array(geners)[selected.row]
                booksVC.books = books.filter({ (book) -> Bool in
                    book.genre == filter
                })
            case Section.Nationality.rawValue:
                filter = Array(nationality)[selected.row]
                booksVC.books = books.filter({ (book) -> Bool in
                    book.author_country == filter
                })
            default:
                filter = nil
                booksVC.books = nil
            }
        }
    }
}
