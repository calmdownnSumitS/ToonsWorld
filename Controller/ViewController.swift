//
//  ViewController.swift
//  ToonsWorld
//
//  Created by Sumit Sharma on 19/11/20.
//

import UIKit
import AVFoundation


var avPlayer: AVPlayer!
var avPlayerLayer: AVPlayerLayer!
var paused: Bool = false
var categorylist = [String]()

let videoArray = ["drama","mystery","love","Action","horror","universal"]


class ViewController: UIViewController {
    
    @IBOutlet weak var topnavigation: UIView!
    @IBOutlet weak var topimgview: UIImageView!
    @IBOutlet weak var backroundView: UIView!
    @IBOutlet weak var tableiew: UITableView!
    @IBOutlet weak var labelCategory: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ViewBottom_DownRadius(value: 20, outlet: self.topimgview)
        topimgview.layer.zPosition = 1
        topnavigation.layer.zPosition = 1
        //extention .mp4 : runbackround,videobackround
        //extention .mov : Forest
        
        categorylist  = ["Drama","Mystery","Love Story","Action","Horror"]
        //.mov
        if let videoUrl = videoArray.randomElement() {

            BackviewVideoplayer(_T: videoUrl, outlet: self.backroundView)

        }

        tableiew.backgroundColor = UIColor.clear

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
     
        if lastviewcontroller == true{
            
            avPlayer.pause()
            paused = true
            lastviewcontroller = false
            
        }else{
            
            avPlayer.play()
            paused = false
            
        }
        
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        avPlayer.pause()
        paused = true
    }
    
    
    
    
}

extension ViewController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return categorylist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableiew.dequeueReusableCell(withIdentifier: "cell") as! GenresTableView
        
        cell.backgroundColor = UIColor.clear
        cell.backroundcellview.layer.cornerRadius = 20.0
        cell.categorylabel.text = categorylist[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(indexPath.row)
        
        avPlayer.pause()
        paused = true
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let viewController = storyboard.instantiateViewController(identifier: "DetailScreenViewController") as? DetailScreenViewController
        viewController?.array_int = indexPath.row
        
        navigationController?.pushViewController(viewController!, animated: true
        )
        
        
        
        
    }
    
    
}

