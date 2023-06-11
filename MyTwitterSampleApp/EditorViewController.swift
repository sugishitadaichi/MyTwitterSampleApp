//
//  EditorViewController.swift
//  MyTwitterSampleApp
//
//  Created by 杉下大智 on 2023/05/19.
//

import UIKit
import RealmSwift

protocol ViewWillApperDelegate {
    func tweetToView()
}

class EditorViewController: UIViewController {
    @IBAction func tweetToViewButton(_ sender: UIButton) {
        var delegate: ViewWillApperDelegate?
        delegate?.tweetToView()

    }
    @IBAction func cancelButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var tweetToViewButton: UIButton!
    @IBOutlet weak var editorView: UITextView!
    
    var tweet = Tweet()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTweetToViewButton()
        editorView.delegate = self
    }
    
    func configure(memo: Tweet) {
        tweet.text = memo.text
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
        let updatedText = editorView.text ?? ""
        saveDate(with: updatedText)
    }
}
