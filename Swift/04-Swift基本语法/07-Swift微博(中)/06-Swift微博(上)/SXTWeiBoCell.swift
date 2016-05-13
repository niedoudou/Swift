//
//  SXTWeiBoCell.swift
//  06-Swift微博(上)


import UIKit

class SXTWeiBoCell: UITableViewCell {
    /// 头像
    @IBOutlet weak var iconView: UIImageView!
    /// 名字
    @IBOutlet weak var nameLab: UILabel!
    /// 时间和来自
    @IBOutlet weak var subLab: UILabel!
    /// 内容
    @IBOutlet weak var contentLab: UILabel!
    /// 图片集合
    @IBOutlet weak var collectionView: UICollectionView!

    // 数据源
    var model: SXTWeiBoModel? {
        didSet {
            // 给控件设置内容
            iconView.image = UIImage(named: (model?.icon)!)
            nameLab.text = model?.name
            subLab.text = model?.sub
            contentLab.text = model?.title
        }
    }
    
    
    
    
    
    
    
    
}
