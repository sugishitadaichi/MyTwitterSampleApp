//
//  EditorViewController.swift
//  MyTwitterSampleApp
//
//  Created by 杉下大智 on 2023/05/19.
//

import UIKit

class EditorViewController: UIViewController {
    @IBOutlet weak var tweetToViewButton: UIButton!
    @IBOutlet weak var editorView: UITextView!
    
    var text: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTweetToViewButton()
    }
    
    func configure(memo: Tweet) {
        text = memo.text
        print("データは\(text)です。")
    }
    //　ツイートボタンの仕様
    func configureTweetToViewButton() {
        tweetToViewButton.layer.cornerRadius = 10
        tweetToViewButton.clipsToBounds = true
    }
}
