//
//  SXTCollectionViewCell.swift


import UIKit

class SXTCollectionViewCell: UICollectionViewCell {
    
    /// 懒加载imageView
    lazy var imageView: UIImageView = {
        let imgView = UIImageView()
        return imgView
    }()
    
    /// 图片名字
    var imageName: String? {
        didSet {
            imageView.image = UIImage(named: imageName!)
        }
    }
    
    /// 设置imageView的frame
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = self.frame
    }
    
    /// 添加图片到cell上
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.contentView.addSubview(imageView)
    }
}
