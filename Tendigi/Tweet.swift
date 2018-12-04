//
//  Tweet.swift
//  Tendigi
//
//  Created by Sam on 12/4/18.
//  Copyright © 2018 Samuel Huang. All rights reserved.
//

import SwiftyJSON

//"id": 907671830634401800,
//"created_at": "2017-09-12 18:26:42",
//"text": "So, can you trick Face ID with a photo? #AppleEvent"
class Tweet {
    var id: String = ""
    var createdAt: String = ""
    var text: String = ""

    init(json: JSON) {
        self.id = json["id"].stringValue
        self.createdAt = json["created_at"].stringValue
        self.text = json["text"].stringValue
    }
}
