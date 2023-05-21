//
//  EditorViewController.swift
//  MyTwitterSampleApp
//
//  Created by 杉下大智 on 2023/05/19.
//

import UIKit

class EditorViewController: UIViewController {
    @IBOutlet weak var editorView: UITextView!
    
    var text: String = ""
    
    func configure(memo: Tweet) {
        text = memo.text
        print("データは\(text)です。")
    }
}
