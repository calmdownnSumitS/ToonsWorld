//
//  DetailScreenViewController.swift
//  ToonsWorld
//
//  Created by Sumit Sharma on 20/11/20.
//

import UIKit
import AVFoundation

var lastviewcontroller = Bool()

class DetailScreenViewController: UIViewController {
    
    
    var array_int = Int()
    var titleArray: [String] = ["The Making Of A Princess","The Making Of A Princess","The Making Of A Princess","The Making Of A Princess","The Making Of A Princess","The Making Of A Princess"]
    
    
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var backroundView: UIView!
    @IBOutlet weak var titledetail: UILabel!
    @IBOutlet weak var collectionview: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lastviewcontroller = true
        
        collectionview.backgroundColor = UIColor.clear
        
        self.titledetail.text = "\(videoArray[array_int])"
        BackviewVideoplayer(_T: videoArray[array_int], outlet: self.backroundView)
        
        infoView.layer.cornerRadius = 10.0
        
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(playerItemDidReachEnd(notification:)),
                                               name: .AVPlayerItemDidPlayToEndTime,
                                               object: avPlayer.currentItem)
        
        
    }
    
    @objc func playerItemDidReachEnd(notification: Notification) {
        let p: AVPlayerItem = notification.object as! AVPlayerItem
        p.seek(to: .zero)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        avPlayer?.play()
        paused = false
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        avPlayer?.pause()
        paused = true
    }
    
    
    
    @IBAction func lastviewController(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
}


extension DetailScreenViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return titleArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let detailcell = collectionview.dequeueReusableCell(withReuseIdentifier: "detailcell", for: indexPath) as! DetailCollectionViewCell
        
        detailcell.imageView.layer.cornerRadius = 10
       // detailcell.imageView.alpha = 0.7
        detailcell.imageView.image = UIImage(named: "\(titleArray[indexPath.row])")
        
        detailcell.titlename.text = titleArray[indexPath.row]
        
        
        return detailcell
        
    }
    
    
    //MARK:- collection view having cell and spacing setup
    

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

            let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout

            let numberofItem: CGFloat = 2

            let collectionViewWidth = collectionView.bounds.width

            let extraSpace = (numberofItem - 1) * flowLayout.minimumInteritemSpacing

            let inset = flowLayout.sectionInset.right + flowLayout.sectionInset.left

            let width = Int((collectionViewWidth - extraSpace - inset) / numberofItem)

            print(width)

            return CGSize(width: width, height: 210)
        }
  
    
}
