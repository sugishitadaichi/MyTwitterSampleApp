//
//  ViewController.swift
//  MyTwitterSampleApp
//
//  Created by 杉下大智 on 2023/04/24.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, EditorViewControllerDelegate, MainTableViewCellDelegate {
    //　編集ボタンがタップされた際の処理
    func transitionToEditedTweetView(indexPath: IndexPath) {
        // Realmのインスタンス化
        let realm = try!Realm()
        //　tweetListのインデックス番号のidをeditTarget定数に取得
        let editTarget = tweetList[indexPath.row].id
        //　targetと同じidを持つRealmデータベース内のデータを検索してeditPostに格納
        let editPost = realm.objects(Tweet.self).filter("id == %@", editTarget).first
        //　もしもeditPostがnilでなければ以下を実行
        if editPost != nil {
            // 画面遷移処理（記載済みのテキストデータが必要？）
            let storyboad = UIStoryboard(name: "EditorViewController", bundle: nil)
            guard let editorViewController = storyboad.instantiateInitialViewController() as? EditorViewController else { return }
            //記載済みのテキストデータを取得
            editorViewController.tweet = editPost ?? Tweet()
            present(editorViewController, animated: true)
            editorViewController.delegate = self
        }
    }
    
    func tweetToView() {
        setTweet()
        tableView.reloadData()
    }
    
    func deleteTweet(indexPath: IndexPath) {
        // Realmのインスタンス化
        let realm = try!Realm()
        //　tweetListのインデックス番号のidをtarget定数に取得
        let target = tweetList[indexPath.row].id
        //　targetと同じidを持つRealmデータベース内のデータを検索してdeletePostに格納
        let deletePost = realm.objects(Tweet.self).filter("id == %@", target).first
        //　もしもdeletePostがnilでなければ以下を実行
        if let deletePost {
            //　reaimの書き込み
            try! realm.write {
                //　deletePostをRealmから削除
                realm.delete(deletePost)
            }
            
        }
        //　tweetListの配列からインデックス番号に該当する配列を削除
        tweetList.remove(at: indexPath.row)
        //　デーブルビューからインデックス番号に該当するセルを削除
        tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        //　テーブルビューの再読み込み
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
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tweetToView()
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
        cell.indexPath = indexPath
        //　デリゲートの登録(複数可？)
        cell.delegate = self
        cell.setupEditButton()
        cell.setupDeleteButton()
        cell.myName()
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
        
