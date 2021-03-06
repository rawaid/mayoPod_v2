//
//  ThirdViewController.swift
//  mayoPod_v2
//
//  Created by Robert Mayo on 2/15/15.
//  Copyright (c) 2015 Robert Mayo. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    @IBOutlet weak var songRemoveSongField: UITextField!
    @IBOutlet weak var songRemoveArtistField: UITextField!
    @IBOutlet weak var songRemoveButton: UIButton!
    @IBOutlet weak var albumRemoveTitleField: UITextField!
    @IBOutlet weak var albumRemoveArtistField: UITextField!
    @IBOutlet weak var albumRemoveButton: UIButton!
    @IBOutlet weak var playlistRemoveField: UITextField!
    @IBOutlet weak var playlistRemoveButton: UIButton!
    
    ///////////////////// Singleton Code ///////////////////////////
    
    
    ////////////////////////////////////////////////////////////////
    
    @IBAction func songRemoval(sender: UIButton) {
        let songName = String(songRemoveSongField.text as NSString)
        let songArtist = String(songRemoveArtistField.text as NSString)

        var valid = true
        if songName == "" || songArtist == ""{
            valid = false
        }
        if valid == true{
            var count = 0
            
            var found = false
            for i in songList {
                if i.getSongName() == songName {
                    if i.getArtistName() == songArtist{
                        removeSong(count)
                        found = true
                        //errorTextView.backgroundColor = UIColor.greenColor()
                        //errorTextView.text = "Song successfully removed. Good job."
                    }
                }
                count++
            }
            if found == true{
                refreshUI()
            } else {
                //errorTextView.backgroundColor = UIColor.redColor()
                //errorTextView.text = "Song not found. MayoPod is confused"
            }
        } else {
            //errorTextView.backgroundColor = UIColor.redColor()
            //errorTextView.text = "Enter in arist and song. MayoPod is angry!"
        }
    }
    
    func removeSong(songIndex: Int) {
        songList.removeAtIndex(songIndex)
    }
    
    @IBAction func albumRemoval(sender: UIButton) {
        let albumName = String(albumRemoveTitleField.text as NSString)
        let albumArtist = String(albumRemoveArtistField.text as NSString)
        
        var valid = true
        if albumName == "" || albumArtist == ""{
            valid = false
        }
        if valid == true{
            var count = 0
            
            var found = false
            for i in albumList{
                if i.getAlbumName() == albumName{
                    if i.getArtistName() == albumArtist{
                        removeAlbum(count)
                        found = true
                        //errorTextView.backgroundColor = UIColor.greenColor()
                        //errorTextView.text = "Song successfully removed. Good job."
                    }
                }
                count++
            }
            if found == true {
                refreshUI()
            }else{
                //errorTextView.backgroundColor = UIColor.redColor()
                //errorTextView.text = "Song not found. MayoPod is confused"
            }
        }else{
            //errorTextView.backgroundColor = UIColor.redColor()
            //errorTextView.text = "Enter in arist and song. MayoPod is angry!"
        }
    }
    
    func removeAlbum(albumIndex: Int) {
        albumList.removeAtIndex(albumIndex)
    }
    
    @IBAction func playlistRemoval(sender: UIButton) {
        let playlistName = String(playlistRemoveField.text as NSString)
        
        var valid = true
        if playlistName == ""{
            valid = false
        }
        if valid == true{
            var count = 0
            
            var found = false
            for i in playlistList{
                if i.getPlaylistName() == playlistName{
                    removeAlbum(count)
                    found = true
                    //errorTextView.backgroundColor = UIColor.greenColor()
                    //errorTextView.text = "Song successfully removed. Good job."
                }
                count++
            }
            if found == true {
                refreshUI()
            }else{
                //errorTextView.backgroundColor = UIColor.redColor()
                //errorTextView.text = "Song not found. MayoPod is confused"
            }
        }else{
            //errorTextView.backgroundColor = UIColor.redColor()
            //errorTextView.text = "Enter in arist and song. MayoPod is angry!"
        }
    }
    
    func removePlaylist(playlistIndex: Int) {
        playlistList.removeAtIndex(playlistIndex)
    }
    
    func refreshUI() {
        songRemoveSongField.text = ""
        songRemoveArtistField.text = ""
        albumRemoveTitleField.text = ""
        albumRemoveArtistField.text = ""
        playlistRemoveField.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}