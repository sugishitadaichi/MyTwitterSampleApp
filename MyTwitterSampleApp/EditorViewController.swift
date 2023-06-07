//
//  EditorViewController.swift
//  MyTwitterSampleApp
//
//  Created by 杉下大智 on 2023/05/19.
//

import UIKit
import RealmSwift

class EditorViewController: UIViewController {
    @IBAction func tweetToButton(_ sender: UIButton) {
        saveDate(with: String)
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
}

extension EditorViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        let updatedText = editorView.text ?? ""
        saveDate(with: updatedText)
    }
}
