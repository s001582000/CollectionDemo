//
//  MainViewController.swift
//  GridViewDemo
//
//  Created by 梁雅軒 on 2016/9/24.
//  Copyright © 2016年 zoaks. All rights reserved.
//

import UIKit

class MainViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var collection: UICollectionView!
    //要秀出來的資料陣列
    var arrData = [MyInfo]()
    
    // MARK:生命週期
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //collectionView的設定 請忽略:p
        collection.register(UINib(nibName: "MyCell", bundle: nil), forCellWithReuseIdentifier: "MyCell")
        let layout:UICollectionViewFlowLayout = collection.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.width / 3)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        //將每一筆資料放入陣列
        let arrName = ["服飾"," 美妝","鞋包","媽咪寶貝","電腦週邊","家電","相機","美食","醫療","餐卷"]
        for i in 1...10 {
            let info = MyInfo()
            info.id = i
            info.name = arrName[i-1]
            let value:CGFloat = CGFloat(i)
            info.color = UIColor (red: 1, green: value*0.09, blue: value * 0.08, alpha: 1)
            arrData.append(info)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK:IBAction
    @IBAction func btnOnClick(_ sender: UIButton) {
        //送出結果查詢
        //輪循所有資料
        //有被選取到的印出來 可以用陣列接住 傳到其他地方
        for info in arrData {
            if info.isSelect {
                print("被選到的有id==\(info.id),name==\(info.name)")
            }
        }
    }
    
    // MARK: collectionViewdelegate
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrData.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! MyCell
        // 秀出每一筆資料
        cell.setInfo(info: arrData[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 每一筆資料的選取與否
        let info = arrData[indexPath.row]
        info.isSelect = !info.isSelect
        collectionView.reloadItems(at: [indexPath])
    }
    
}

//每一筆資料的Class
class MyInfo: NSObject {
    var id = 0
    var name = ""
    var isSelect = false
    var color:UIColor!
}
