//
//  EditorViewController.swift
//  MyTwitterSampleApp
//
//  Created by 杉下大智 on 2023/05/19.
//

import UIKit
import RealmSwift

protocol EditorViewControllerDelegate {
    func tweetToView()
}

class EditorViewController: UIViewController {
    @IBAction func tweetToViewButton(_ sender: UIButton) {
        let updatedText = editorView.text ?? ""
        saveDate(with: updatedText)
        delegate?.tweetToView()
    }
    @IBAction func cancelButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var tweetToViewButton: UIButton!
    
    @IBOutlet weak var editorView: UITextView!

    
    var tweet = Tweet()
    var delegate: EditorViewControllerDelegate?
    var isEdit = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //　editorViewのtextにtweetの内容を代入
        editorView.text = String(tweet.text)
        //UITextViewDelegateを反映させる
        editorView.delegate = self
            
        configureTweetToViewButton()
    }
    
    func configure(memo: Tweet) {
        tweet.text = memo.text
        editorView.text = String(tweet.text)
    }
    //　ツイートボタンの仕様
    func configureTweetToViewButton() {
        tweetToViewButton.layer.cornerRadius = 10
        tweetToViewButton.clipsToBounds = true
    }
    func saveDate(with text: String) {
        let realm = try! Realm()
        try! realm.write {
            tweet.text = text
            realm.add(tweet)
        }
        print("text: \(tweet.text)")
        dismiss(animated: true)

    }
    //　ツイートボタンがタップされた際に画面遷移する処理
    func transitionToTweetMainView() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateInitialViewController() as? ViewController else { return }
        present(viewController, animated: true)
    }
    //　ツイートボタンがタップされた際の処理？
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _ = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        present(viewController, animated: true)
    
    }
    //　テスト用
    func evcOutput(number: Int?) -> Int? {
        return number
    }
}

//　文字数制限機能の追加
extension EditorViewController: UITextViewDelegate {
    //　入力制限を140文字以内で設定
    func textView(text: String) -> Bool {
        // 更新された文字数(最終文字数)が最大値以下であればtrueを返却
        return isTextWithinMaxLength(text: text)
    }
        
        // 文字数の制限をチェックする関数
        func isTextWithinMaxLength(text: String) -> Bool {
            //　最大文字数を140文字以内で設定
            let maxLength = 140
            //　現在入力されている文字数を取得
            let currentString = editorView.text
            //　更新された文字数の取得、入力される度に判定する、判定はテキストビューのテキストの長さ
            guard let updatedString = currentString else { return (0 != 0) }
            let updatedCheckString = currentString?.replacingCharacters(in: NSRange(location: 0, length: currentString?.count ?? 0), with: updatedString)
            print("文字数制限が適用されました")
            //　更新された文字数(最終文字数)が最大値以下であればtrueを返却
            return updatedCheckString.count <= maxLength
        }
    //　テスト用
    func exEVCOutput(number: Int?) -> Int? {
        return number
    }
}
