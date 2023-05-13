//
//  ViewController.swift
//  MyTwitterSampleApp
//
//  Created by 杉下大智 on 2023/04/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    //ツイートプロパティ
    var tweetList: [Tweet] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        // setTweet関数をホーム画面が表示された際に反映させる
        setTweet()
    }
    // ツイートを格納するためのメソッド
    func setTweet() {
        let tweetPost1 = Tweet(text: "あいうえお", userName: "daichi")
        let tweetPost2 = Tweet(text: "かきくけこ", userName: "saki")
        let tweetPost3 = Tweet(text: "さしすせそ", userName: "yamato")
        let tweetPost4 = Tweet(text: "たちつてと", userName: "makoto")
        let tweetPost5 = Tweet(text: "なにぬねの", userName: "yoshihiro")
        
        let dummyList = [ tweetPost1, tweetPost2, tweetPost3, tweetPost4, tweetPost5, ]
         dummyList.forEach { tweet in tweetList.append(tweet) }
        

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweetList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! MainTableViewCell
        
        let tweet = tweetList[indexPath.row]
        cell.label.text = tweet.text
        cell.userName.text = tweet.userName
        return cell
    }

}
