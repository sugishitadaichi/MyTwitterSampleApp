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
        let tweetPost1 = Tweet(text: "あいうえお")
        tweetList.append(tweetPost1)
        let tweetPost2 = Tweet(text: "かきくけこ")
        tweetList.append(tweetPost2)
        let tweetPost3 = Tweet(text: "さしすせそ")
        tweetList.append(tweetPost3)
        let tweetPost4 = Tweet(text: "たちつてと")
        tweetList.append(tweetPost4)
        let tweetPost5 = Tweet(text: "なにぬねの")
        tweetList.append(tweetPost5)
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let tweet: Tweet = tweetList[indexPath.row]
        cell.textLabel?.text = tweet.text
        return cell
    }
}

