//
//  VideoSplash.swift
//  MP3
//
//  Created by Бексултан Нурпейс on 19.12.2021.
//

import UIKit
import MediaPlayer
import AVKit

public enum ScalingMode {
  case resize
  case resizeAspect
  case resizeAspectFill
}

open class VideoSplash: UIViewController {
    
    
    open override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
    }
    fileprivate let moviePlayer = AVPlayerViewController()
    fileprivate var moviePlayerSoundLevel: Float = 1.0
    open var contentURL: URL? {
      didSet {
        setMoviePlayer(contentURL!)
      }
    }
    
    open var videoFrame: CGRect = CGRect()
    open var startTime: CGFloat = 0.0
    open var duration: CGFloat = 0.0
    open var backgroundColor: UIColor = UIColor.black {
      didSet {
        view.backgroundColor = backgroundColor
      }
    }
    open var sound: Bool = true {
      didSet {
        if sound {
          moviePlayerSoundLevel = 1.0
        }else{
          moviePlayerSoundLevel = 0.0
        }
      }
    }
    open var alpha: CGFloat = CGFloat() {
      didSet {
        moviePlayer.view.alpha = alpha
      }
    }
    open var alwaysRepeat: Bool = true {
      didSet {
        if alwaysRepeat {
          NotificationCenter.default.addObserver(self,
            selector: #selector(VideoSplash.playerItemDidReachEnd),
            name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
            object: moviePlayer.player?.currentItem)
        }
      }
    }
    open var fillMode: ScalingMode = .resizeAspectFill {
      didSet {
        switch fillMode {
        case .resize:
          moviePlayer.videoGravity = convertToAVLayerVideoGravity(AVLayerVideoGravity.resize.rawValue)
        case .resizeAspect:
          moviePlayer.videoGravity = convertToAVLayerVideoGravity(AVLayerVideoGravity.resizeAspect.rawValue)
        case .resizeAspectFill:
          moviePlayer.videoGravity = convertToAVLayerVideoGravity(AVLayerVideoGravity.resizeAspectFill.rawValue)
        }
      }
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        moviePlayer.view.frame = videoFrame
        moviePlayer.showsPlaybackControls = false
        view.addSubview(moviePlayer.view)
        view.sendSubviewToBack(moviePlayer.view)
    }
    open override func viewWillAppear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    fileprivate func setMoviePlayer(_ url: URL){
      let videoCutter = VideoCutter()
      videoCutter.cropVideoWithUrl(videoUrl: url, startTime: startTime, duration: duration) { (videoPath, error) -> Void in
        if let path = videoPath as URL? {
          DispatchQueue.global().async {
            DispatchQueue.main.async {
              self.moviePlayer.player = AVPlayer(url: path)
              self.moviePlayer.player?.play()
              self.moviePlayer.player?.volume = self.moviePlayerSoundLevel
            }
          }
        }
      }
    }
    
    open override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func playerItemDidReachEnd() {
      moviePlayer.player?.seek(to: CMTime.zero)
      moviePlayer.player?.play()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

fileprivate func convertToAVLayerVideoGravity(_ input: String) -> AVLayerVideoGravity {
    return AVLayerVideoGravity(rawValue: input)
}
