//
//  Tweet.swift
//  MyTwitterSampleApp
//
//  Created by 杉下大智 on 2023/05/06.
//

import Foundation
import RealmSwift

class Tweet: Object {
    // ツイート本文
    @objc dynamic var id: String = UUID().uuidString //データを一意に識別するための識別子
    @objc dynamic var text: String = ""
    @objc dynamic var userName: String = ""
}
