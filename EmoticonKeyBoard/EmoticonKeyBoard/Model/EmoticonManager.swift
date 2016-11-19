//
//  EmoticonManager.swift
//  EmoticonKeyBoard
//
//  Created by 莫清霆 on 2016/11/19.
//  Copyright © 2016年 莫清霆. All rights reserved.
//

import Foundation

class EmoticonManager {

    //表情包数组
    var packages :[EmoticonPackage] = [EmoticonPackage]()
    
    init(){
        //添加最近表情的包
        self.packages.append(EmoticonPackage(id: ""))
        
        //添加默认的表情包
        self.packages.append(EmoticonPackage(id: "com.sina.default"))
        
        //添加emoji的表情包
        self.packages.append(EmoticonPackage(id: "com.apple.emoji"))
        
        //添加浪小花表情包
        self.packages.append(EmoticonPackage(id: "com.sina.lxh"))
    }
}
