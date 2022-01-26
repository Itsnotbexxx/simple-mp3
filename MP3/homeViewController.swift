//
//  homeViewController.swift
//  MP3
//
//  Created by Бексултан Нурпейс on 26.12.2021.
//

import UIKit
import AVFoundation
import FirebaseAuth

class homeViewController: UIViewController, UITableViewDelegate, AVAudioPlayerDelegate, UITableViewDataSource {
 
    @IBAction func signout(_ sender: UIBarButtonItem) {
        do{
            try Auth.auth().signOut()
        }catch{
            print("error message")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    var shouldForcePlayBecauseTheMusicChanged = false
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Song.songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rowNumber = indexPath.row
        
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.black
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "rowSong", for: indexPath) as! TableViewCellSong
        
        cell.selectedBackgroundView = bgColorView
        
        cell.imgSongBg.image = UIImage(named: Song.songs[rowNumber].songBgFileName)
        
        cell.lblSongTitle.text = Song.songs[rowNumber].songTitle
        cell.lblSongArtist.text = Song.songs[rowNumber].songArtist
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        switch editingStyle {
            
        case UITableViewCell.EditingStyle.delete:
            Song.songs.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            
            AudioManager.play()
            AudioManager.stop()
            
            Song.selectedSong = 0
            
            prepareOutletsPlaySong(selectedSong: 0, isFirstTime: true)
            
        default:
            break
            
        }
        
    }
    
    func prepareOutletsPlaySong(selectedSong: Int, isFirstTime: Bool) {
        if (!AudioManager.isPlaying() && !AudioManager.isPaused) || shouldForcePlayBecauseTheMusicChanged {
        
            AudioManager.prepareToPlay(fileName: Song.songs[selectedSong].songFileName, fileExtension: Song.songs[selectedSong].songFileExtension)
            
            AudioManager.audioPlayer.delegate = self
            
            AudioManager.play()
            
        }
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let rowNumber = indexPath.row
        
        shouldForcePlayBecauseTheMusicChanged = Song.selectedSong != rowNumber
        
        Song.selectedSong = rowNumber
        
        performSegue(withIdentifier: "toVCSong", sender: self)
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let selectedSong = Song.selectedSong
        
        let vcSong = segue.destination as! VCSong
        
        vcSong.shouldForcePlayBecauseTheMusicChanged = shouldForcePlayBecauseTheMusicChanged
        
        vcSong.songBg = Song.songs[selectedSong].songBgFileName
        
        vcSong.songTitle = Song.songs[selectedSong].songTitle
        vcSong.songArtist = Song.songs[selectedSong].songArtist
        
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
       
        Song.selectedSong = 0
        
        prepareOutletsPlaySong(selectedSong: 0, isFirstTime: true)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        shouldForcePlayBecauseTheMusicChanged = false
        
    

        AudioManager.audioPlayer.delegate = self
        
        
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




