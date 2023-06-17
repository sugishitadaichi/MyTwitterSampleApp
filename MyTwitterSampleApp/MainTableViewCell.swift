//
//  MainTableViewCell.swift
//  MyTwitterSampleApp
//
//  Created by 杉下大智 on 2023/05/07.
//

import UIKit
import RealmSwift

protocol MainTableViewCellDelegate {
    func deleteTweet()
}

class MainTableViewCell: UITableViewCell {
    @IBAction func deleteButton(_ sender: UIButton) {
        let realm = try!Realm()
        guard let tweet = tweet else { return }
        let deletePost = realm.objects(Tweet.self).filter("id == %@", tweet.id).first
        delegate?.deleteTweet()
        if let deletePost = deletePost {
            try! realm.write {
                realm.delete(deletePost)
            }
        }
        
    }
    var tweet: Tweet?
    var delegate: MainTableViewCellDelegate?
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        configureEditButton()
        
        configureDeleteButton()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    //　編集ボタンの仕様
    func configureEditButton() {
        editButton.layer.cornerRadius = 10
        editButton.clipsToBounds = true
    }
    //　削除ボタンの仕様
    func configureDeleteButton() {
        deleteButton.layer.cornerRadius = 10
        deleteButton.clipsToBounds = true
        
    }
}
