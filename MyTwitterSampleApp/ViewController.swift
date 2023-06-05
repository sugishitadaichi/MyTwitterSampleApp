//
//  ViewController.swift
//  MyTwitterSampleApp
//
//  Created by 杉下大智 on 2023/04/24.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    @IBAction func addButton(_ sender: UIButton) {
        //　transitionToTweetEditorView関数をボタンがタップされた際に実行させる
        transitionToTweetEditorView()
        
    }
    
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
        //　configureTweetButton関数をホーム画面が表示された際に反映させる
        configureTweetButton()

    }
    // ツイートを格納するためのメソッド
    func setTweet() {
        let tweetPost1 = Tweet()
        tweetPost1.text = "あいうえおかきくけこたちつてとなにぬねのはひふへほまみむめも"
        tweetPost1.userName = "daichi"
        let tweetPost2 = Tweet()
        tweetPost2.text = "かきくけこかきくけこたちつてとなにぬねのはひふへほまみむめもかきくけこたちつてとなにぬねのはひふへほまみむめもかきくけこたちつてとなにぬねのはひふへほまみむめも"
        tweetPost2.userName = "saki"
        let tweetPost3 = Tweet()
        tweetPost3.text = "saki"
        tweetPost3.userName = "yamato"
        let tweetPost4 = Tweet()
        tweetPost4.text = "たちつてとかきくけこたちつてとなにぬねの"
        tweetPost4.userName = "makoto"
        let tweetPost5 = Tweet()
        tweetPost5.text = "なにぬねのかきくけこたちつてとなにぬねのはひふへほまみむめもかきくけこたちつてとなにぬねのはひふへほまみむめもかきくけこたちつてとなにぬねのはひふへほまみむめもかきくけこたちつてとなにぬねのはひふへほまみむめもかきくけこたちつてとなにぬねのはひふへほまみむめもかきくけこたちつてとなにぬねのはひふへほまみむめも"
        tweetPost5.userName = "yoshihiro"
        
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
    //　ツイートボタンの仕様
    func configureTweetButton() {
        addButton.layer.cornerRadius = addButton.bounds.width / 2
    }
    //　ツイートボタンがタップされた際の処理
    func transitionToTweetEditorView() {
        let storyboard = UIStoryboard(name: "EditorViewController", bundle: nil)
        guard let editorViewController = storyboard.instantiateInitialViewController() as? EditorViewController else { return }
        present(editorViewController, animated: true)
    }
    //　＋ボタンがタップされた際の処理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _ = UIStoryboard(name: "EditorViewController", bundle: nil)
        let editorViewController = storyboard?.instantiateViewController(identifier: "EditorViewController") as! EditorViewController
        present(editorViewController, animated: true)
    
    }
    
    func saveDate() {}

}
        
