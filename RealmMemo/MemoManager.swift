//
//  PostCollection.swift
//  RealmMemoApp
//
//  Created by KumagaiNaoki on 2016/02/05.
//  Copyright © 2016年 KumagaiNaoki. All rights reserved.
//

import UIKit
import RealmSwift

class MemoManager: NSObject {
    
    static let sharedInstance = MemoManager()
    var memos: [Memo] = []
    var resultsArray: [Memo] = []
    let realm = try! Realm()
    
    func addPostCollection(memo: Memo){
        try! realm.write({ () in
            realm.add(memo)
            self.memos.insert(memo, atIndex: 0)
        })
    }
    
    func fetchPosts(){
        let allMemos = realm.objects(Memo)
        for oneMemo in allMemos {
            let memo = Memo()
            memo.text = oneMemo["text"] as! String
            self.memos.insert(oneMemo, atIndex: 0)
        }
    }
    
    func searchPosts(searchText:String) {
        resultsArray.removeAll()
        let results = realm.objects(Memo).filter("text CONTAINS '\(searchText)'")
        for result in results {
            let memo = Memo()
            memo.text = result["text"] as! String
            memo.date = result["date"] as! String
            resultsArray.insert(memo, atIndex: 0)
        }
    }
    
}