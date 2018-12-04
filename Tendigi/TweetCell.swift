//
//  TweetCell.swift
//  Tendigi
//
//  Created by Sam on 12/4/18.
//  Copyright © 2018 Samuel Huang. All rights reserved.
//

import Stevia

class TweetCell: UITableViewCell {

    lazy var label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()

    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()

    lazy var idLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()

    func set(tweet: Tweet) {
        label.text = tweet.text
        dateLabel.text = String(tweet.createdAt.prefix(10))
        idLabel.text = tweet.id
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        sv([label, dateLabel, idLabel])
        label.top(5).left(10).right(10).height(80)
        dateLabel.bottom(5).right(10).width(40%).height(20)
        idLabel.bottom(5).left(10).width(40%).height(20)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    class var reuseIdentifier: String {
        return "TweetCell"
    }
}
