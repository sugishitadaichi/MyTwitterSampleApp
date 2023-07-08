//
//  Tweet.swift
//  MyTwitterSampleApp
//
//  Created by 杉下大智 on 2023/05/06.
//

import Foundation
import RealmSwift

class Tweet: Object,ObjectKeyIdentifiable {
    // ツイート本文
    @Persisted(primaryKey: true) var id: ObjectId //データを一意に識別するための識別子
    @Persisted var text: String = ""
    @Persisted var userName: String = ""
    @Persisted var recordDate: Date = Date()
    @Persisted var persistedShare:Bool = true
    var share:Bool = false
    
    //　テスト用
    func tweetOutput(number: Int?) -> Int? {
        return number
    }

}
