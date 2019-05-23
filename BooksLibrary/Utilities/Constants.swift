//
//  Constants.swift
//  BooksLibrary
//
//  Created by Gourav  Garg on 23/05/19.
//  Copyright © 2019 Gourav  Garg. All rights reserved.
//

import Foundation
enum BookSection: String {
    case authors = "Authors"
    case generes = "Genres"
    case nationalities = "Nationalities"
}

enum Section: Int {
    case Author
    case Genere
    case Nationality
}

typealias Books = [Book]


//enum AuthorCountry: String, Codable {
//    case china = "China"
//    case india = "India"
//    case iran = "Iran"
//}
//
//enum AuthorName: String, Codable {
//    case arundhatiRoy = "Arundhati Roy"
//    case chetanBhagat = "Chetan Bhagat"
//}
//
//enum Genre: String, Codable {
//    case fiction = "Fiction"
//    case politics = "Politics"
//}
//
//enum Publisher: String, Codable {
//    case penguin = "Penguin"
//}
