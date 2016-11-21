//
//  ViewController.swift
//  EmoticonKeyBoard
//
//  Created by 莫清霆 on 2016/11/18.
//  Copyright © 2016年 莫清霆. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //输入框控件
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func sendItemClick(_ sender: Any) {
        
  
        print("获取字符串:" + self.textView.getEmoticonString())
    }

    //懒加载属性
    fileprivate lazy var emoticonVc:EmoticonController = EmoticonController{[weak self]
        (emoticon) ->() in
        self?.textView.insertEmoticon(emoticon: emoticon)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        self.textView.inputView = self.emoticonVc.view
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //弹出键盘
        self.textView.becomeFirstResponder()
    }

}

extension ViewController{
    
}
