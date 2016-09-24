//
//  MyCell.swift
//  GridViewDemo
//
//  Created by 梁雅軒 on 2016/9/24.
//  Copyright © 2016年 zoaks. All rights reserved.
//

import UIKit

class MyCell: UICollectionViewCell {
    @IBOutlet weak var viewSelect: UIView!
    @IBOutlet weak var lblName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setInfo(info: MyInfo)  {
        lblName.text = info.name
        backgroundColor = info.color
        viewSelect.isHidden = !info.isSelect
    }
}
