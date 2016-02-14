//
//  TableViewController.swift
//  RealmMemoApp
//
//  Created by KumagaiNaoki on 2016/02/05.
//  Copyright © 2016年 KumagaiNaoki. All rights reserved.


import UIKit
import RealmSwift

class MainTableViewController: UITableViewController,UITextFieldDelegate{
    
    @IBOutlet weak var textField: UITextField!
    let memoManager = MemoManager.sharedInstance
    var currentDateTime = ""
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        textField.delegate = self
        makeTapGesture()
        memoManager.fetchPosts()
        
//        let realm = try!Realm()
//        print(realm.path)//シュミレーターの場合、保存場所のパス
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memoManager.memos.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MemoCell", forIndexPath: indexPath)
        let memo = self.memoManager.memos[indexPath.row]
        cell.textLabel!.text = memo.text
        cell.detailTextLabel!.text = memo.date
        return cell
    }
    
    //MARK: -Action
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        currentDateTime = NSDate.getNowDate()
        if textField.text!.isEmpty {
            print("テキスト空")
        } else {
            let memo = Memo(text: textField.text!, date: currentDateTime)
            self.memoManager.addPostCollection(memo)
            self.tableView.reloadData()
            textField.text = ""
        }
        return true
    }
    
    func makeTapGesture(){
        let tapRecogniser = UITapGestureRecognizer(target: self, action: "tap:")
        self.view.addGestureRecognizer(tapRecogniser)
    }
    func tap(sender:UITapGestureRecognizer){
        textField.resignFirstResponder()
    }
}
