//
//  Model.swift
//  AsyncAwait2
//
//  Created by Charles Michael on 3/28/25.
//

import Foundation

struct User: Decodable, Identifiable {
    let id: Int
    let name: String
    let email: String
    let ohone: String
}

struct Post: Decodable, Identifiable {
    let id: Int
    let title: String
    let body: String
    let userId: Int
}
