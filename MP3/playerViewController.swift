//
//  playerViewController.swift
//  MP3
//
//  Created by Бексултан Нурпейс on 24.12.2021.
//

import UIKit
import AVFoundation

class playerViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var paley_image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = songs[thisSong]
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func play(_ sender: UIButton) {
        if audioPlayer.isPlaying == false {
            audioPlayer.play()
        }
    }
    
    @IBAction func pause(_ sender: UIButton) {
        if audioPlayer.isPlaying == true {
            audioPlayer.pause()
        }
    }
    
    @IBAction func next(_ sender: UIButton) {
        if thisSong<songs.count-1 {
            thisSong += 1 //increment song count
            playThis(thisOne: songs[thisSong])
        }
        else {
            thisSong = 0 //loop around
            playThis(thisOne: songs[thisSong])
        }
        // load song name
        label.text = songs[thisSong]
     }
    
    @IBAction func prev(_ sender: UIButton) {
        if thisSong>0 {
            thisSong -= 1 //decrement song count
            playThis(thisOne: songs[thisSong])
        }
        else {
            thisSong = songs.count-1 //loop around
            playThis(thisOne: songs[thisSong])
        }
        // load song name
        label.text = songs[thisSong]
    }
    
    @IBAction func slide_volume(_ sender: UISlider) {
        audioPlayer.volume = sender.value
    }
    
    func playThis(thisOne: String) {
        //play song associated with that name
        do {
            let audioPath = Bundle.main.path(forResource: thisOne, ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            audioPlayer.play()
        } catch {
            print("Error")
        }
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
