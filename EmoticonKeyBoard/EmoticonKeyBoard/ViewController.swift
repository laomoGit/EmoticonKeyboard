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
        //1.获取属性字符串
        let attrMStr = NSMutableAttributedString(attributedString: self.textView.attributedText)
        
        //2.遍历属性字符串
        let range = NSRange(location: 0, length: attrMStr.length)
        
        print("字符串的长度：\(attrMStr.length)")
        
        attrMStr.enumerateAttributes(in: range, options: []){(dict,range,_) ->Void in
            
            if let attachment = dict["NSAttachment"] as? EmoticonAttachment {
                
                attrMStr.replaceCharacters(in: range, with: attachment.chs!)
            }
        }
        
        //3.获取字符串
       print("获取字符串:" + attrMStr.string)
    }
    
    
    
    
    
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
        if emoticon.isRemove{
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
        //4.1根据图片路径创建按属性字符串
        let attachment = NSTextAttachment()
        attachment.image = UIImage(contentsOfFile: emoticon.pngPath!)
        let font = self.textView.font
        
        attachment.bounds = CGRect(x: 0, y: -4, width: (font?.lineHeight)!, height: (font?.lineHeight)!)
        let attrImageStr = NSAttributedString(attachment:attachment)
        
        
        //4.2创建可变的属性字符串
        let attrMStr = NSMutableAttributedString(attributedString: self.textView.attributedText)
        
        //4.3将图片属性字符串，替换到可变属性字符串的某个位置
        //4.3.1获取光标所在的位置
        let range = self.textView.selectedRange
        
        //4.3.2替换属性字符串
        attrMStr.replaceCharacters(in: range, with: attrImageStr)
        
        //显示属性字符串
        self.textView.attributedText = attrMStr
        
        //将文字的大小重置
        self.textView.font = font
        
        //将光标设置回原来的位置
        self.textView.selectedRange = NSRange(location: range.location + 1, length: 0)
        
        
        
        
        
    }
}

extension ViewController{
    
    
    
}
