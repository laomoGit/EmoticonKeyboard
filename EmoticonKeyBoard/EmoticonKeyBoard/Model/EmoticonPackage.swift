//
//  EmoticonPackage.swift
//  EmoticonKeyBoard
//
//  Created by 莫清霆 on 2016/11/19.
//  Copyright © 2016年 莫清霆. All rights reserved.
//

import UIKit

class EmoticonPackage: NSObject {
    var emoticons : [Emoticon] = [Emoticon]()
    
    
    init(id :String) {
        super.init()
        //最近组
        if id == ""{
            addEmptyEmoticon(isRecently: true)
            return
        }
        
        //根据id 拼接info.plist的路径
        let plistPath = Bundle.main.path(forResource: "\(id)/info.plist", ofType: nil, inDirectory: "Emoticons.bundle")!
        print("表情包全路径：\(plistPath)")
        
        //根据plist文件的路径读取数据[[String:String]]
        let array = NSArray(contentsOfFile: plistPath)! as! [[String : String]]
        
        //遍历数组
        var index = 0
        for var dict in array {
            if let png = dict["png"] {
                dict["png"] = id + "/" + png
                print("表情：\(dict)")
            }
            
            self.emoticons.append(Emoticon(dict: dict))
            
            index += 1
            
            if index == 20{
                //添加删除表情
                self.emoticons.append(Emoticon(isRemove:true))
                index = 0
            }
        }
        
        //添加空白表情
        addEmptyEmoticon(isRecently: false)
    }
    
    
    ///添加空白表情
     private func addEmptyEmoticon(isRecently:Bool){
        let count = emoticons.count % 21
        
        if count == 0 && !isRecently {
            return
        }
        
        for _ in count..<20{
            self.emoticons.append(Emoticon(isEmpty:true))
            
        }
        
        //最后添加
        self.emoticons.append(Emoticon(isRemove: true))
        
    }
}
