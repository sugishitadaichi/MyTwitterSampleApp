//
//  ViewController.swift
//  MyTwitterSampleApp
//
//  Created by 杉下大智 on 2023/04/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    //ツイートプロパティ
    var tweetList: [Tweet] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        // setTweet関数をホーム画面が表示された際に反映させる
        setTweet()
    }
    // ツイートを格納するためのメソッド
    func setTweet() {
        let tweetPost = Tweet(text: "あいうえお")
        tweetList.append(tweetPost)
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let tweet: Tweet = tweetList[indexPath.row]
        cell.textLabel?.text = tweet.text
        return cell
    }
}

