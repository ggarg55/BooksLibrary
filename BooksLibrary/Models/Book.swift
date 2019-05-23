//
//  Book.swift
//  BooksLibrary
//
//  Created by Gourav  Garg on 23/05/19.
//  Copyright © 2019 Gourav  Garg. All rights reserved.
//

import Foundation

struct Book : Codable {
    let id : String?
    let book_title : String?
    let author_name : String?
    let genre : String?
    let publisher : String?
    let author_country : String?
    let sold_count : Int?
    let image_url : String?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case book_title = "book_title"
        case author_name = "author_name"
        case genre = "genre"
        case publisher = "publisher"
        case author_country = "author_country"
        case sold_count = "sold_count"
        case image_url = "image_url"
    }
    
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        id = try values.decodeIfPresent(String.self, forKey: .id)
//        book_title = try values.decodeIfPresent(String.self, forKey: .book_title)
//        author_name = try values.decodeIfPresent(String.self, forKey: .author_name)
//        genre = try values.decodeIfPresent(String.self, forKey: .genre)
//        publisher = try values.decodeIfPresent(String.self, forKey: .publisher)
//        author_country = try values.decodeIfPresent(String.self, forKey: .author_country)
//        sold_count = try values.decodeIfPresent(Int.self, forKey: .sold_count)
//        image_url = try values.decodeIfPresent(String.self, forKey: .image_url)
//    }    
}

