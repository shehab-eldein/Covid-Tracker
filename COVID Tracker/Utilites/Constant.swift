//
//  Constant.swift
//  COVID Tracker
//
//  Created by shehab ahmed on 17/01/2022.
//

import Network
import Alamofire
struct Networking {
    static let headers: HTTPHeaders = [
        "x-rapidapi-host": "covid-193.p.rapidapi.com",
        "x-rapidapi-key": "368589b189mshd9e4ed0e9e120b4p13b0b2jsncda8a4f5a5f6"
    ]
    static let allUrl = "https://covid-193.p.rapidapi.com/statistics"
   
    static func searchCountryURL(country: String,date: String)-> String {

        let URL = "https://covid-193.p.rapidapi.com/history?country=\(country)&day=\(date)"
        return URL
    }
}
