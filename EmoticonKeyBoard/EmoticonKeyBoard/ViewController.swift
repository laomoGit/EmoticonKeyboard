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
    fileprivate lazy var emoticonVc:EmoticonController = EmoticonController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.textView.inputView = self.emoticonVc.view
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //弹出键盘
        self.textView.becomeFirstResponder()
    }

}

