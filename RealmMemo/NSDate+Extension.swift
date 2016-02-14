//
//  NSDate+Extension.swift
//  RealmMemo
//
//  Created by KumagaiNaoki on 2016/02/14.
//  Copyright © 2016年 KumagaiNaoki. All rights reserved.
//

import Foundation

extension NSDate {
    class func getNowDate() -> String {
        let now = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        return formatter.stringFromDate(now)
    }

}