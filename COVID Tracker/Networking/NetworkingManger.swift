//
//  NetworkingManger.swift
//  COVID Tracker
//
//  Created by shehab ahmed on 17/01/2022.
//
import Foundation
import Alamofire

struct NetworkingManager {
    
    static  func get (country: String?,Date: String?,spinner: UIActivityIndicatorView? , completion: @escaping(_ error: Error?, _ mediaArr: [information]?, _ resultNum: Int?) -> Void) {
        let all = Networking.allUrl
        let byCountry = Networking.searchCountryURL(country: country ?? "", date: Date ?? "")
        var parameter: String!
        if country == nil {
            parameter = all
        } else {
            parameter = byCountry
        }
        AF.request(parameter , method: .get, parameters: nil , encoding: URLEncoding.default, headers: Networking.headers).response {
            
            response in
            if let erorr = response.error {
                completion(erorr,nil, nil)
                print(erorr)
            }
            if let data = response.data {
                do {
                    let results = try JSONDecoder().decode(AllResponse.self, from:data ).response
                    let resultNum = try JSONDecoder().decode(AllResponse.self, from: data).results
                    completion(nil,results, resultNum)
                    spinner?.isHidden = true
                } catch {
                    print("EROR from the data:\(error)")
                }
            }
        }
    }
    
    
    
}
