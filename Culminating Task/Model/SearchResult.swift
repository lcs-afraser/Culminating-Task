//
//  SearchResult.swift
//  Culminating Task
//
//  Created by Alistair Fraser on 2023-06-02.
//

import Foundation

struct SearchResult: Codable {
    let resultCount: Int
    let results: [Song]
}
