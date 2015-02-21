//
//  FirstViewController.swift
//  mayoPod_v2
//
//  Created by Robert Mayo on 2/15/15.
//  Copyright (c) 2015 Robert Mayo. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var songNameField: UITextField!
    @IBOutlet weak var songArtistField: UITextField!
    @IBOutlet weak var songComposerField: UITextField!
    @IBOutlet weak var songAlbumField: UITextField!
    @IBOutlet weak var songProducerField: UITextField!
    @IBOutlet weak var songYearLbel: UILabel!
    @IBOutlet weak var songLengthLabel: UILabel!
    @IBOutlet weak var songLengthSlider: UISlider!
    @IBOutlet weak var songYearStepper: UIStepper!
    
    ///////////////////// Singleton Code ///////////////////////////
    
    var thePlaylistModel: sharedPlaylistModel = sharedPlaylistModel.theSharedPlaylistModel
    var myPlaylist:Playlist = Playlist()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myPlaylist = thePlaylistModel.thePlaylist
    }
    
    // this works because we initialize mySong to an empty Song
    override func viewWillAppear(animated: Bool) {
        if (myPlaylist.plistName != "none")
        {
            .text = myPlaylist.plistName
        }
    }
    
    @IBAction func textFieldDoneEditing(sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func backgroundTap(sender: UIControl) {
        songNameField.resignFirstResponder()
    }
    
    @IBAction func saveSongPressed(sender: UIButton) {
        myPlaylist.plistSong = Song()
    }
    ////////////////////////////////////////////////////////////////
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func songYearStep(sender: UIStepper) {
        //sets label text value as sent value form user click
        songYearLbel.text = Int(sender.value).description
    }
    
    @IBAction func songLengthChange(sender: UISlider) {
        var seconds = (sender.value%60)
        var minutes = (sender.value-seconds)/60
        songLengthLabel.text = String(Int(minutes))+":"+String(Int(seconds))
        if seconds < 10{
            songLengthLabel.text = String(Int(minutes))+":0"+String(Int(seconds))
        }
    }
    
    //creates list of songs
    var songList: [Song] = []
    var albumList: [Album] = []
    var playlistList: [Playlist] = []
    
    @IBAction func addSong(sender: AnyObject) {
        let songName = String(songNameField.text as NSString)
        let songArtist = String(songArtistField.text as NSString)
        let songAlbum = String(songAlbumField.text as NSString)
        let songComposer = String(songComposerField.text as NSString)
        let songLength = (songLengthSlider.value)
        let songYear = (Int(songYearStepper.value))
        let songProducer = String(songProducerField.text as NSString)
        
        var valid = true
        if songName == "" || songArtist == "" || songComposer == ""{
            valid = false
        }
        
        if valid == true{
            let newSong = Song(song: songName, artist:songArtist, year: songYear,length:songLength,composer:songComposer,album:songAlbum)
            var alreadyEntered = false
            for i in songList {
                if i.getSongName() == songName{
                    if i.getSongArtist() == songArtist{
                        // error statement
                        alreadyEntered = true
                    }
                }
            }
            refreshUI()
            if alreadyEntered == false{
                
                songList.append(newSong)
                let alertController = UIAlertController(title: "SUCCESS", message:
                    "The song has been successfully added.", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "Sweet, thanks.", style: UIAlertActionStyle.Default,handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
                
                if songAlbum != ""{
                    var foundAlbum = false
                    for i in albumList{
                        if songAlbum == i.getAlbumName(){
                            foundAlbum = true
                            i.addSongToPlaylist(newSong)
                        }
                        
                    }
                    if foundAlbum == false{
                        let newAlbum = Album(albumName: songAlbum, artist: songArtist, year: songYear, producer: songProducer)
                        albumList.append(newAlbum)
                    }
                }
                
            } else {
                let alertController = UIAlertController(title: "ERROR", message:
                    "The song has already been added, will not be entered again.", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "Sweet, thanks.", style: UIAlertActionStyle.Default,handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
            }
        } else {
            let alertController = UIAlertController(title: "ERROR", message:
                "Song name, artist and composer fields must be filled. Album and producer may be left empty.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Sweet, thanks.", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        
    }
    @IBAction func addPlaylist(sender: AnyObject) {
        
    }
    
    func refreshUI(){
        songYearLbel.text = "2015"
        songYearStepper.value = 2015
        songNameField.text = ""
        songComposerField.text = ""
        songArtistField.text = ""
        songAlbumField.text = ""
        songProducerField.text = ""
    }
    
}

