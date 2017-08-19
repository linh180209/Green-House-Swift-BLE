//
//  DashboardViewController.swift
//  Green House
//
//  Created by TH-MD on 4/20/17.
//  Copyright © 2017 TH-MD. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController,UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    //@IBOutlet weak var viewTest: UIView!
    //@IBOutlet weak var viewSettings: UIView!
    //@IBOutlet weak var viewCheck: UIView!
    //@IBOutlet weak var viewActive: UIView!
    @IBOutlet weak var viewDevice: UIView!
    @IBOutlet weak var viewRoot: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var ActiveOff : ActiveOff!
    override func viewDidLoad() {
        super.viewDidLoad()
        //let Arrayview :[UIView] = [viewTest,viewSettings,viewCheck,viewActive];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.layer.borderColor = UIColor.white.cgColor
        collectionView.layer.borderWidth = 1.0
        collectionView.layer.cornerRadius = 1.0
        
        self.ActiveOff = Bundle.main.loadNibNamed("ActiveOff", owner: self, options: nil)?[0] as! ActiveOff
        self.ActiveOff.frame = CGRect(x:0,y:0, width: self.viewRoot.frame.size.width, height: self.viewRoot.frame.size.height)
        self.ActiveOff.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.viewRoot.addSubview(self.ActiveOff)
        
        //update ui
        self.SetUI();
        
//        for view in Arrayview {
//            view.layer.borderColor = UIColor.white.cgColor
//            view.layer.borderWidth = 1.0
//            view.layer.cornerRadius = 1.0
//        }
        // Do any additional setup after loading the view.
    }

    func SetUI(){
        self.ActiveOff.view1.layer.borderColor = UIColor.white.cgColor;
        self.ActiveOff.view1.layer.borderWidth = 1.0
        self.ActiveOff.view1.layer.cornerRadius = 1.0
        
        self.ActiveOff.view2.layer.borderColor = UIColor.white.cgColor;
        self.ActiveOff.view2.layer.borderWidth = 1.0
        self.ActiveOff.view2.layer.cornerRadius = 1.0
        
        self.ActiveOff.view3.layer.borderColor = UIColor.white.cgColor;
        self.ActiveOff.view3.layer.borderWidth = 1.0
        self.ActiveOff.view3.layer.cornerRadius = 1.0
        
        self.ActiveOff.view4.layer.borderColor = UIColor.white.cgColor;
        self.ActiveOff.view4.layer.borderWidth = 1.0
        self.ActiveOff.view4.layer.cornerRadius = 1.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomeCell", for: indexPath) as! CustomeCell
        cell.label1.text = "Hello";
        cell.label1.layer.borderColor = UIColor.white.cgColor
        cell.label1.layer.borderWidth = 1.0
        cell.label1.layer.cornerRadius = 1.0
        
        cell.label2.layer.borderColor = UIColor.white.cgColor
        cell.label2.layer.borderWidth = 1.0
        cell.label2.layer.cornerRadius = 1.0
        
        cell.label3.layer.borderColor = UIColor.white.cgColor
        cell.label3.layer.borderWidth = 1.0
        cell.label3.layer.cornerRadius = 1.0
        
        cell.label4.layer.borderColor = UIColor.white.cgColor
        cell.label4.layer.borderWidth = 1.0
        cell.label4.layer.cornerRadius = 1.0
        
        return cell;
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.size.width - 10, height: collectionView.bounds.height - 10);
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("positon: " , collectionView.contentOffset.x);
        var currentPage:Float;
        currentPage = Float(collectionView.contentOffset.x/collectionView.frame.size.width);
        print("positon: " , round(currentPage));
        let indexPath = IndexPath(row: Int(round(currentPage)), section: 0)
        collectionView.scrollToItem(at: indexPath, at: UICollectionViewScrollPosition.right, animated: true)
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("positon: " , collectionView.contentOffset.x);
        var currentPage:Float;
        currentPage = Float(collectionView.contentOffset.x/collectionView.frame.size.width);
        print("positon: " , round(currentPage));
        let indexPath = IndexPath(row: Int(round(currentPage)), section: 0)
        collectionView.scrollToItem(at: indexPath, at: UICollectionViewScrollPosition.centeredVertically, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
