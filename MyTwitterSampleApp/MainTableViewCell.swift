//
//  MainTableViewCell.swift
//  MyTwitterSampleApp
//
//  Created by 杉下大智 on 2023/05/07.
//

import UIKit
import RealmSwift

protocol MainTableViewCellDelegate {
    func deleteTweet(indexPath: IndexPath)
    func transitionToEditedTweetView(indexPath: IndexPath)
}

class MainTableViewCell: UITableViewCell, UITableViewDelegate{
    
    //　編集ボタンを押す処理の追加
    @IBAction func editButton(_ sender: UIButton) {
        delegate?.transitionToEditedTweetView(indexPath: indexPath!)
        
    }
    @IBAction func deleteButton(_ sender: UIButton) {
        //　あくまで処理を実行するのはViewControllerなので、これだけでOK
        delegate?.deleteTweet(indexPath: indexPath!)
    }
    
    func configure() {
        guard let indexPath = indexPath else { return }
        textLabel?.text = "Row: \(indexPath.row), Section: \(indexPath.section)"
    }
    var indexPath: IndexPath?
    var tweet: Tweet?
    var delegate: MainTableViewCellDelegate?
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var label: UILabel!
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    //　編集ボタンの仕様
    func setupEditButton() {
            editButton.layer.cornerRadius = 10
        editButton.clipsToBounds = true
    }
    //　削除ボタンの仕様
    func setupDeleteButton() {
        deleteButton.layer.cornerRadius = 10
        deleteButton.clipsToBounds = true
        
    }
    //　ユーザー名をdaichiに設定
    func myName() {
        userName.text = "daichi"
    }
    //　テスト用
    func mtvcOutput(number: Int?) -> Int? {
        return number
    }
}
