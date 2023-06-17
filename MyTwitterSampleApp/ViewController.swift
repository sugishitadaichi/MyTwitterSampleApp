//
//  ViewController.swift
//  MyTwitterSampleApp
//
//  Created by 杉下大智 on 2023/04/24.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, EditorViewControllerDelegate, MainTableViewCellDelegate {
    func tweetToView() {
        setTweet()
        tableView.reloadData()
    }
    
    func deleteTweet() {
        setTweet()
        tableView.reloadData()
    }
    
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
        //　configureTweetButton関数をホーム画面が表示された際に反映させる
        configureTweetButton()
        tweetToView()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        deleteTweet()
    }
    

    // ツイートを格納するためのメソッド
    func setTweet() {
        let realm = try! Realm()
        let result = realm.objects(Tweet.self).sorted(byKeyPath: "recordDate", ascending: false)
        tweetList = Array(result)

    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweetList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! MainTableViewCell
        
        let tweet = tweetList[indexPath.row]
        cell.label.text = tweet.text
        cell.tweet = tweet
        cell.userName.text = tweet.userName
        return cell
    }
    //　＋ボタンの仕様
    func configureTweetButton() {
        addButton.layer.cornerRadius = addButton.bounds.width / 2
    }
    //　＋ボタンがタップされた際に画面遷移する処理
    func transitionToTweetEditorView() {
        let storyboard = UIStoryboard(name: "EditorViewController", bundle: nil)
        guard let editorViewController = storyboard.instantiateInitialViewController() as? EditorViewController else { return }
        present(editorViewController, animated: true)

        editorViewController.delegate = self
    }
    //　＋ボタンがタップされた際の処理？
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _ = UIStoryboard(name: "EditorViewController", bundle: nil)
        let editorViewController = storyboard?.instantiateViewController(identifier: "EditorViewController") as! EditorViewController
        present(editorViewController, animated: true)
    
    }

}
        
