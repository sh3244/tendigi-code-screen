//
//  APIManager.swift
//  Tendigi
//
//  Created by Sam on 12/4/18.
//  Copyright © 2018 Samuel Huang. All rights reserved.
//

import SwiftyJSON

class APIManager {
    static let shared = APIManager()

    class func loadTweets(_ completion: @escaping (([Tweet]) -> Void)) {
        let request = URLRequest(url: URL(string: "http://static.tendigi.com/tweets.json")!)
        let task = URLSession.shared.dataTask(with: request) { data, response, err in
            guard let data = data, let array = try? JSON(data: data).array, let tweetsArray = array else {
                return
            }
            completion(tweetsArray.compactMap({ json -> Tweet? in
                return Tweet(json: json)
            }))
        }
        task.resume()
    }
}

//let url = URL(string: "http://www.stackoverflow.com")!
//
//let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
//    guard let data = data else { return }
//    print(String(data: data, encoding: .utf8)!)
//}
//
//task.resume()
