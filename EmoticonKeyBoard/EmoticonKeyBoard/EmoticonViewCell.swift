//
//  EmoticonViewCell.swift
//  EmoticonKeyBoard
//
//  Created by 莫清霆 on 2016/11/19.
//  Copyright © 2016年 莫清霆. All rights reserved.
//

import UIKit

class EmoticonViewCell: UICollectionViewCell {
    //懒加载属性
    fileprivate lazy var emoticonBtn :UIButton = UIButton()
    
    //MARK:定义的属性
    var emoticon: Emoticon? {
        didSet{
            guard let emoticon = emoticon else{
                return
            }
            
            //设置emoticonBtn 的内容
            self.emoticonBtn.setImage(UIImage(contentsOfFile:emoticon.pngPath ?? ""), for: .normal)
            self.emoticonBtn.setTitle(emoticon.emojiCode, for: .normal)
            
            
            //设置删除按钮
            if emoticon.isRemove{
                self.emoticonBtn.setImage(UIImage(named:"compose_emotion_delete"), for: .normal)
            }
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK:设置界面UI

extension EmoticonViewCell{
    
    //设置接界面
    fileprivate func setupUI(){
        //添加子控件
        self.contentView.addSubview(self.emoticonBtn)
        
        //设置btn 的frame
        self.emoticonBtn.frame = self.contentView.bounds
        
        //设置btn属性
        self.emoticonBtn.isUserInteractionEnabled = false
        self.emoticonBtn.titleLabel?.font = UIFont.systemFont(ofSize: 32)
    }
    
}
