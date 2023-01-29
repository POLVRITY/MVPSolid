//
//  Person.swift
//  MVPSolid
//
//  Created by Владислав Белый on 25.01.2023.
//

import Foundation

struct Comment: Codable {
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
}
