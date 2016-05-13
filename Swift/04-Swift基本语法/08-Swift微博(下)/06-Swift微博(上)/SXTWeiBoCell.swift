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
    /// 图片容器
    @IBOutlet weak var collectionView: SXTCollectionView!

    /// collectionView的宽度约束
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    /// collectionView的高度约束
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    /// collectionView顶部约束
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    // 数据源
    var model: SXTWeiBoModel? {
        didSet {
            // 给控件设置内容
            iconView.image = UIImage(named: (model?.icon)!)
            nameLab.text = model?.name
            subLab.text = model?.sub
            contentLab.text = model?.title
            
            // 处理展示图片
            collectionView.images = model?.images
            
            // 修改collectionView的宽高约束
            widthConstraint.constant = collectionView.bounds.width
            heightConstraint.constant = collectionView.bounds.height
            topConstraint.constant = (model?.images?.count == 0) ? 0 : 10
            
            // 刷新约束
            layoutIfNeeded()
            
            // 保存行高
            model?.cellHeight = CGRectGetMaxY(collectionView.frame) + 10
            
            // 刷新collectionView
            collectionView.reloadData()
        }
    }
}
