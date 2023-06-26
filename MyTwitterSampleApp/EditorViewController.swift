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
    //　文字数を140文字以内に定義
    let maxWritewordLength = 140
    
    var tweet = Tweet()
    var delegate: EditorViewControllerDelegate?
    var isEdit = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTweetToViewButton()
        editorView.delegate = self
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
}

extension EditorViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
    }
}
//　文字数制限機能の追加
extension EditorViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard editorView.text != nil else { return }
        
        if editorView.text.count > maxWritewordLength {
            //　最大文字数を超えた場合は切り捨て
            editorView.text = String(editorView.text.prefix(maxWritewordLength))
            
        }
    }
}
