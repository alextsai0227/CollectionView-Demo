//
//  HorizentalCollectionViewCell.swift
//  CollectionViewInCollectionView
//
//  Created by 蔡舜珵 on 2016/7/1.
//  Copyright © 2016年 蔡舜珵. All rights reserved.
//

import UIKit

class HorizentalCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var imageArray = [UIImage(named:"view1"),UIImage(named:"view2"),UIImage(named:"view3"),UIImage(named:"view4"),UIImage(named:"view5")]

    @IBOutlet weak var pageControl: UIPageControl!
   

    @IBOutlet weak var collectionViewlayput: UICollectionViewFlowLayout!
    
    override func awakeFromNib() {
        pageControl.numberOfPages = imageArray.count
        collectionView.dataSource = self
        collectionView.delegate = self
        // 另外一種addTarget的作法（用來呼叫Function）
        //  pageControl.addTarget(self, action: #selector(HorizentalCollectionViewCell.pageChanged(_:)), forControlEvents: UIControlEvents.ValueChanged)
    }
    @IBAction func pageChanged2(sender: AnyObject) {
        let pageControl = sender as? UIPageControl
        let x = CGFloat(pageControl!.currentPage) * UIScreen.mainScreen().bounds.width
        let collectionView = self.collectionView
        collectionView.setContentOffset(CGPointMake(x, 0), animated: true)
        
    }
}
extension HorizentalCollectionViewCell : UICollectionViewDataSource,UICollectionViewDelegate {
    
    
    func pageChanged(sender:AnyObject) {
        let pageControl = sender as? UIPageControl
        let x = CGFloat(pageControl!.currentPage) * UIScreen.mainScreen().bounds.width
        let collectionView = self.collectionView
        collectionView.setContentOffset(CGPointMake(x, 0), animated: true)
        
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ImageCell", forIndexPath: indexPath) as! ImageCollectionViewCell
        print("hehehe:\(collectionView)")
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: UIScreen.mainScreen().bounds.width, height: 200)
        
        
        cell.imageView.image = imageArray[indexPath.row]
        
        
        
        
        
        return cell
    }
    func scrollViewWillBeginDecelerating(scrollView: UIScrollView) {
        let pageNum = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        self.pageControl!.currentPage = Int(pageNum)
    }

    
}
