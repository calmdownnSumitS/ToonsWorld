//
//  genericmethods.swift
//  ToonsWorld
//
//  Created by Sumit Sharma on 19/11/20.
//

import Foundation
import UIKit
import AVFoundation


    
func ViewBottom_DownRadius(value : Int, outlet : UIView)  {
    
    outlet.layer.cornerRadius = CGFloat(value)
    outlet.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    outlet.clipsToBounds = true
}


func ViewTop_UPRadius(value : Int, outlet : UIView)  {
    
    outlet.clipsToBounds = true
    outlet.layer.cornerRadius = CGFloat(value)
    outlet.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
}

func BackviewVideoplayer(_T : String, outlet : UIView){
    
    let theURL = Bundle.main.url(forResource:_T, withExtension: "mp4")
    
    avPlayer = AVPlayer(url: theURL!)
    avPlayerLayer = AVPlayerLayer(player: avPlayer)
    avPlayerLayer.videoGravity = .resizeAspectFill
    avPlayer.volume = 1
    avPlayer.actionAtItemEnd = .none
    
    avPlayerLayer.frame = outlet.layer.bounds
    outlet.backgroundColor = .clear
    outlet.layer.insertSublayer(avPlayerLayer, at: 0)
    
}
