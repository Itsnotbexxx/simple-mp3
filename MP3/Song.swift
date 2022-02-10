//
//  Song.swift
//  MP3
//
//  Created by Бексултан Нурпейс on 27.12.2021.
//

import Foundation

class Song {
    
    
    var songTitle = ""
    var songArtist = ""
    
    var songFileName = ""
    var songFileExtension = ""
    
    var songBgFileName = ""
    
    static var traverseMode = 0
    
    static var selectedSong = -1
    static var songs: [Song] = [
        Song(songTitle: "No Friends in the Industry", songArtist: "Drake", songFileName: "nofriend", songFileExtension: "mp3", songBgFileName: "drake.jpeg"),
        Song(songTitle: "After Hours", songArtist: "The Weekend", songFileName: "afterhours", songFileExtension: "mp3", songBgFileName: "theweek.jpeg"),
        Song(songTitle: "Enjoy Yourself", songArtist: "Pop Smoke", songFileName: "enjoy", songFileExtension: "mp3", songBgFileName: "pops.jpeg"),
        Song(songTitle: "Mood Swings", songArtist: "Pop Smoke", songFileName: "moodswings", songFileExtension: "mp3", songBgFileName: "pops2.jpeg"),
        Song(songTitle: "Perfect", songArtist: "Ed Sheeran", songFileName: "ed", songFileExtension: "mp3", songBgFileName: "ed.jpeg"),
        Song(songTitle: "Love me now", songArtist: "John Legend", songFileName: "john", songFileExtension: "mp3", songBgFileName: "john.jpeg")
    ]
    
    
    init(songTitle: String, songArtist: String, songFileName: String, songFileExtension: String, songBgFileName: String) {
        
        self.songTitle = songTitle
        self.songArtist = songArtist
        
        self.songFileName = songFileName
        self.songFileExtension = songFileExtension
        
        self.songBgFileName = songBgFileName
        
    }
    
    
}
