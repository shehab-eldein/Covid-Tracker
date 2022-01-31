//
//  allResponse.swift
//  COVID Tracker
//
//  Created by shehab ahmed on 17/01/2022.
//

import Foundation
struct AllResponse: Codable {
    var results: Int
    var get: String
    var response: [information]
}
struct information: Codable {
    var continent: String?
    var  country: String?
    var population: Int?
    var cases: cases?
    var deaths: deaths?
    var tests: tests?
    
}
struct cases: Codable {
    var new: String? 
    var active: Int?
    var critical: Int?
    var recovered: Int?
    var total: Int?
}
struct deaths: Codable {
    var new: String?
    var total: Int?
}
struct tests: Codable {
    var total: Int?
}
