//
//  ViewController.swift
//  CollectionViewInCollectionView
//
//  Created by 蔡舜珵 on 2016/7/1.
//  Copyright © 2016年 蔡舜珵. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    var reuseIdentifier = "VerticalCell"
    var horizantalIdentifier = "HorizantalCell"
    var imageArray = [UIImage(named:"view1"),UIImage(named:"view2"),UIImage(named:"view3"),UIImage(named:"view4"),UIImage(named:"view5")]
    var horizentalCollectionViewCell : HorizentalCollectionViewCell?
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewLayout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.dataSource = self
        self.collectionView.delegate = self
       
        
        self.horizentalCollectionViewCell = HorizentalCollectionViewCell()

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count + 1
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        if indexPath.item == 0{
            return CGSize(width: UIScreen.mainScreen().bounds.width, height: 200)
        } else{
            let spacingWidth = Float(10)
            let width = (Float(UIScreen.mainScreen().bounds.width) - spacingWidth * Float(2 + 1)) / 2
            self.collectionViewLayout.itemSize = CGSize(width: CGFloat(width), height: CGFloat(width))
            return self.collectionViewLayout.itemSize
        }
        
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0{
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(horizantalIdentifier, forIndexPath: indexPath) as! HorizentalCollectionViewCell
            
            
            
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath)
            let imageView = cell.viewWithTag(1) as! UIImageView
            imageView.image = self.imageArray[indexPath.row-1]
            
            
            return cell
            
            
        }
        
        
        
        
    }

}

    
    

