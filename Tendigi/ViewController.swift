//
//  ViewController.swift
//  Tendigi
//
//  Created by Sam on 12/4/18.
//  Copyright © 2018 Samuel Huang. All rights reserved.
//

import Stevia

class ViewController: UIViewController {

    var tweets: [Tweet] = []

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TweetCell.self, forCellReuseIdentifier: TweetCell.reuseIdentifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red

        view.sv(tableView)
        tableView.fillContainer()

        load()
    }

    func load() {
        APIManager.loadTweets { (tweets) in
            DispatchQueue.main.async {
                self.tweets = tweets
                self.tableView.reloadData()
            }
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tweetCell = tableView.dequeueReusableCell(withIdentifier: TweetCell.reuseIdentifier, for: indexPath) as? TweetCell else {
            return TweetCell()
        }
        tweetCell.set(tweet: tweets[indexPath.row])
        return tweetCell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
