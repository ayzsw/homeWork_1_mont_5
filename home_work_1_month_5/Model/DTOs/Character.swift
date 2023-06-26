//
//  Character.swift
//  home_work_1_month_5
//
//  Created by Аяз on 26/6/23.
//

import Foundation

struct Characters: Decodable {
    let results: [Character]
}

struct Character: Decodable {
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let image: String
}
