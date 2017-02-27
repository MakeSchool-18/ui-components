//
//  VideoPlayerViewController.swift
//  VideoCamera
//
//  Created by Kenny Batista on 2/21/17.
//  Copyright © 2017 kennybatista. All rights reserved.
//

import UIKit
import AVFoundation



class UICustomKennyVideoPlayer: UIViewController {
    
    // [Start of - Properties] ---------Properties-----------Properties-------------Properties---------------Properties----------
    
    //url to get media from
    fileprivate var url: URL!
    
    // convert url to an asset
    fileprivate var asset: AVURLAsset!
    
    // make asset into an item
    fileprivate var item: AVPlayerItem!
    
    // player
    fileprivate var player: AVPlayer!
    
    //player layer
    fileprivate var playerLayer: AVPlayerLayer!
    
    // Time Remaining
    fileprivate var timeObserver: AnyObject!

    
    @IBOutlet weak var timeRemainingLabel: UILabel!
    // Seeker buttons
    @IBOutlet weak var videoPlayerContainerView: UIView!
    
    var playerRateBeforeSeek: Float = 0
    
    
    
    @IBOutlet weak var backwardsButtonOutlet: UIButton!
    
    @IBOutlet weak var playOrPauseButtonOutlet: UIButton!
    
    @IBOutlet weak var forwardButtonOutlet: UIButton!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    
    
    @IBAction func seekFiveSecondsBackwardButton(_ sender: Any) {
        seekBackward()
    }
    
    @IBAction func playOrPauseButton(_ sender: Any) {
        pauseOrPlay()
    }
    
    @IBAction func seekFiveSecondsForwardButton(_ sender: Any) {
        seekForward()
    }
    
    var playPauseBool: Bool!
    
    @IBOutlet weak var VideoPlayerView: UIView!
    
    
 
    
    
    // [End - Properties] ---------Properties-----------Properties-------------Properties---------------Properties----------
    
    
    //START - [METHODS ----------METHODS------------------------METHODS---------------------METHODS--------------------------- ]
    
 
    
    init(urlToPlayMediaFrom: URL){
        self.url = URL(string: String(describing: urlToPlayMediaFrom))
        self.asset = AVURLAsset(url: url)
        self.item = AVPlayerItem(asset: asset)
        self.player = AVPlayer(playerItem: item)
        self.playerLayer = AVPlayerLayer(player: player)
        super.init(nibName: "UICustomKennyVideoPlayerView", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadView()
        player.play()
        
        timeRemainingLabel.layer.cornerRadius = 10
        
        // time remaining
        let timeInterval: CMTime = CMTimeMakeWithSeconds(1.0, 10)
        timeObserver = player.addPeriodicTimeObserver(forInterval: timeInterval, queue: DispatchQueue.main, using: {
            elapsedTime in
            print("elapsedTime now", CMTimeGetSeconds(elapsedTime))
            self.observeTime(elapsedTime: elapsedTime)
            
        }) as AnyObject!
        
        
        playPauseBool = false
        
       
    }
    
    deinit {
        player.removeTimeObserver(timeObserver)
    }
    
    override func loadView() {
        super.loadView()
        
        VideoPlayerView.layer.addSublayer(playerLayer)
        VideoPlayerView.backgroundColor = UIColor.clear
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        playerLayer.cornerRadius = 10
        playerLayer.frame = VideoPlayerView.bounds
        playerLayer.backgroundColor = UIColor.clear.cgColor
        playerLayer.masksToBounds = true
        
        
        playOrPauseButtonOutlet.bringSubview(toFront: self.view)
        backwardsButtonOutlet.bringSubview(toFront: self.view)
        forwardButtonOutlet.bringSubview(toFront: self.view)
        
        //add to subview
        VideoPlayerView.addSubview(timeRemainingLabel)
        VideoPlayerView.addSubview(forwardButtonOutlet)
        VideoPlayerView.addSubview(backwardsButtonOutlet)
        VideoPlayerView.addSubview(playOrPauseButtonOutlet)
        VideoPlayerView.addSubview(videoPlayerContainerView)
        videoPlayerContainerView.layer.cornerRadius = 7
        videoPlayerContainerView.addSubview(progressView)
        
        //Shadows
        VideoPlayerView.layer.shadowColor = UIColor.black.cgColor
        VideoPlayerView.layer.shadowOpacity = 0.7
        VideoPlayerView.layer.shadowOffset = CGSize.zero
        VideoPlayerView.layer.shadowRadius = 5
  
    }
    
    
    // Start - Time Remaining Methods
    
    
    fileprivate func observeTime(elapsedTime: CMTime) {
        let duration = CMTimeGetSeconds((player.currentItem?.duration)!)
        let elapsedTime = CMTimeGetSeconds(elapsedTime)
        
        //updtae time label
        updateTimeLabel(elapsedTime: elapsedTime, duration: duration)
        
        //track progresss
        progressView.progress = Float(elapsedTime / duration)
        
    }
    
    fileprivate func updateTimeLabel(elapsedTime: Float64, duration: Float64) {
        //        let timeRemaining: Float64 = CMTimeGetSeconds(player.currentItem!.duration) - elapsedTime
        let currentTime = CMTimeGetSeconds((player.currentItem?.currentTime())!)
        timeRemainingLabel.text = String(format: "%02d:%02d", ((lround(currentTime) / 60) % 60), lround(currentTime) % 60)
        
    }
    
    
    fileprivate func currentPlayBackTime() -> CMTime {
        return (player.currentItem?.currentTime())!
    }
    
    fileprivate func seekForward(){
        print(#function)
        //        let targetTime = CMTimeMake(player.currentItem?.duration, 1)
        
        let preSubtractedCurrentTime = CMTimeGetSeconds((player.currentItem?.currentTime())!)
        let subtractedTime = preSubtractedCurrentTime + 5.0
        let convertedSubtractedTime = CMTimeMakeWithSeconds(subtractedTime, 1)
        self.player.seek(to: convertedSubtractedTime)
    }
    
    fileprivate func seekBackward(){
        print(#function)
        let preSubtractedCurrentTime = CMTimeGetSeconds((player.currentItem?.currentTime())!)
        let subtractedTime = preSubtractedCurrentTime - 5.0
        let convertedSubtractedTime = CMTimeMakeWithSeconds(subtractedTime, 1)
        self.player.seek(to: convertedSubtractedTime)
    }
    
    fileprivate func pauseOrPlay(){
        print(#function)
        if playPauseBool == false {
            playPauseBool = true
            playOrPauseButtonOutlet.setImage(UIImage(named: "Play.png"), for: .normal)
            player.pause()
        } else if playPauseBool == true {
            playPauseBool = false
            playOrPauseButtonOutlet.setImage(UIImage(named: "Pause.png"), for: .normal)
            player.play()
        }
    }
    
    
    //End - Seeker Methods
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //[END of - METHODS ----------METHODS------------------------METHODS---------------------METHODS--------------------------- ]
}
