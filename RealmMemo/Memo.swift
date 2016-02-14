//
//  Memo.swift
//  RealmMemo
//
//  Created by KumagaiNaoki on 2016/02/11.
//  Copyright © 2016年 KumagaiNaoki. All rights reserved.
//

import Foundation
import RealmSwift

class Memo: Object {
    
    dynamic var text = ""
    dynamic var date = ""
    
    convenience init(text: String, date: String) {
        self.init()
        self.text = text
        self.date = date
    }
}
