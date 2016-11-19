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
    var code :String?       //emoji的code
    var png :String?        //普通表情对应的图片名称
    var chs :String?        //普通表情对应的文字
    
    //构造函数
    init(dict :[String : String]) {
        super.init()
        
        setValuesForKeys(dict)
        
    }
    
    override func setValue(_ value: Any?, forKey key: String) {
        
    }
    
    override var description: String{
        
        
        return dictionaryWithValues(forKeys: ["code","png","chs"]).description
    }
}
