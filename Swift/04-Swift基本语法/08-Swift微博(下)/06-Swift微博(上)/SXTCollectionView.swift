//
//  SXTCollectionView.swift


import UIKit

/// 通知的key
let kImageNameNotificationKey = "kImageNameNotificationKey"

/// 定义图片的宽高
let imageWH: CGFloat = 80

/// 图片之间的间距
let imageMargin: CGFloat = 10

class SXTCollectionView: UICollectionView {

    /// 展示图片的数组
    var images: [String]? {
        didSet {
            // 计算itemSize和colllectionView的size
            let (itemSize, size) = prepareForCollectionViewSize()
            
            // 获取flowLayout
            let layout = self.collectionViewLayout as! UICollectionViewFlowLayout
            
            // 设置itemSize
            layout.itemSize = itemSize
            
            // 设置collectionView的宽高
            self.bounds.size = size
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // 设置代理
        self.dataSource = self
        self.delegate = self
    }
    
    /*
    private 用来修饰私有方法和私有属性
    */
    /// 计算itemSize和colllectionView的size
    private func prepareForCollectionViewSize() -> (itemSize: CGSize, size: CGSize) {
        // 处理没有图片的时候
        if images?.count == 0 {
            return (CGSize(width: 0.1, height: 0.1), CGSizeZero)
        }
        // 处理一张图片的
        if images?.count == 1 {
            // 获取图片
            let image = UIImage(named: (images?.first)!)
            // 获取图片的size
            let imgSize = image?.size

            // 计算展示图片的宽度
            var width: CGFloat = 200
            if imgSize?.width > imgSize?.height {
                width = 250
            }
            
            // 计算展示图片的高度
            let height = (imgSize?.height)!/(imgSize?.width)! * width
            
            // itemSize和size
            let size = CGSize(width: width, height: height)
            
            return (size, size)
        }
        
        // 处理四张图片
        if images?.count == 4 {
            // 计算collection的宽高
            let collWH: CGFloat = 2.0*imageWH + imageMargin
            return (CGSize(width: imageWH, height: imageWH), CGSize(width: collWH, height: collWH))
        }
        
        // 处理其他类型的图片
        // 1.计算collectionView的宽度
        let width = 3.0*imageWH + 2*imageMargin
        // 2.计算collectionView的高度
        // 2.1获取图片展示的行数
        let row = ((images?.count)! - 1) / 3 + 1
        // 2.2得到collectionView的高度
        let height = CGFloat(row)*imageWH + (CGFloat(row) - 1.0)*imageMargin
        
        // 3.返回collectionView的高宽
        return (CGSize(width: imageWH, height: imageWH), CGSize(width: width, height: height))
    }
}


extension SXTCollectionView: UICollectionViewDataSource, UICollectionViewDelegate {
    /// MARK - 数据源代理
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images?.count ?? 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("collectionCellID", forIndexPath: indexPath) as! SXTCollectionViewCell
        
        cell.backgroundColor = UIColor.redColor()
        cell.imageName = images![indexPath.item]
        
        return cell
    }
    
    /// MARK - 代理方法 
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let imageName = images![indexPath.row]
        
        // post一个通知
        NSNotificationCenter.defaultCenter().postNotificationName(kImageNameNotificationKey, object: nil, userInfo: ["imageName" : imageName])
    }
    
}
