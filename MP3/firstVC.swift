//
//  firstVC.swift
//  MP3
//
//  Created by Бексултан Нурпейс on 19.12.2021.
//

import UIKit

class firstVC: VideoSplash {

    override func viewDidLoad() {
        super.viewDidLoad()
           
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
       setupVideoBackground()
    }
    func setupVideoBackground() {
      let url = URL(fileURLWithPath: Bundle.main.path(forResource: "almaty", ofType: "mp4")!)
      
      // setup layout
      videoFrame = view.frame
      fillMode = .resizeAspectFill
      alwaysRepeat = true
      sound = true
      startTime = 2.0
      alpha = 0.8
      
      contentURL = url
      view.isUserInteractionEnabled = true
    }

    @IBOutlet weak var login_pressed: UIButton!
    
    @IBOutlet weak var signup_pressed: UIButton!
    
    
 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
