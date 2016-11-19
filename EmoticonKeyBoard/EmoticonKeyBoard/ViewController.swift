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
    
    //懒加载属性
    fileprivate lazy var emoticonVc:EmoticonController = EmoticonController{[weak self]
        (emoticon) ->() in
        self?.insertEmoticonIntoTextView(emoticon: emoticon)
        
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
    
    ///将表情键盘插入textView
     func insertEmoticonIntoTextView(emoticon:Emoticon){
        //空白表情
        if emoticon.isEmpty {
            return
        }
        
        //删除按钮
        if emoticon.isEmpty{
            self.textView.deleteBackward()
            return
        }
        
        //emoji 表情
        if emoticon.emojiCode != nil{
            //获取光标所在的位置：UITextRange
            let textRange = self.textView.selectedTextRange!
            
            //替换emoji表情
            self.textView.replace(textRange, withText: emoticon.emojiCode!)
            
            return
        }
        
        //普通表情：图文混编
        
        
    }
}

