//
//  Emoticon.swift
//  EmoticonKeyBoard
//
//  Created by 莫清霆 on 2016/11/19.
//  Copyright © 2016年 莫清霆. All rights reserved.
//

import UIKit

class Emoticon: NSObject {
    
    //MARK:定义属性
    var code :String? {      //emoji的code
        didSet{
            guard let code = code else{
                return
            }
            
            //创建扫描器
            let scanner = Scanner(string:code)
            
            //调用方法，扫描code的中的值
            var value :UInt32 = 0
            scanner.scanHexInt32(&value)
            
            //将value 转成字符
            let c = Character(UnicodeScalar(value)!)
            
            //将字符转成字符串
            self.emojiCode = String(c)
        }
        
    }
    
    
    var png :String?{        //普通表情对应的图片名称
        didSet{
            guard let png = png else{
                return
            }
            
            self.pngPath = Bundle.main.bundlePath + "/Emoticons.bundle/" + png
            print("pngPath : \(pngPath)")
        }
        
    }
    var chs :String?        //普通表情对应的文字
    
    
    //MARK:数据处理
    var pngPath :String?
    var emojiCode :String?
    
    var isRemove:Bool = false//删除
    var isRecently:Bool = false //是否空白
    
    //构造函数
    init(dict :[String : String]) {
        super.init()
        
        print("生成表情：\(dict.description)")
        self.setValuesForKeys(dict)
        
    }
    
    
    init(isRemove:Bool) {
        self.isRemove = isRemove
    }
    
    init(isRecently:Bool) {
        self.isRecently = isRecently
    }

    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    override var description: String{
        
        
        return dictionaryWithValues(forKeys: ["emojiCode","pngPath","chs"]).description
    }
}
