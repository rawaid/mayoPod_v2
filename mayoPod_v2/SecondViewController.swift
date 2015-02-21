//
//  SecondViewController.swift
//  mayoPod_v2
//
//  Created by Robert Mayo on 2/15/15.
//  Copyright (c) 2015 Robert Mayo. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var sortedTextView: UITextView!
    @IBOutlet weak var sortSegmenter: UISegmentedControl!
    
    ///////////////////// Singleton Code ///////////////////////////
    
    var thePlaylistModel: sharedPlaylistModel = sharedPlaylistModel.theSharedPlaylistModel
    var myPlaylist:Playlist = Playlist()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myPlaylist = thePlaylistModel.thePlaylist
        
        sortedTextView.backgroundColor = UIColor.grayColor()
    }
    
    override func viewWillAppear(animated: Bool) {
        if (myPlaylist.plistName != "none")
        {
            sortedTextView.text = myPlaylist.plistName
        }
    }
    
    @IBAction func textFieldDoneEditing(sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func backgroundTap(sender: UIControl) {
        sortedTextView.resignFirstResponder()
    }
    
    @IBAction func saveSongPressed(sender: UIButton) {
        myPlaylist.plistName = sortedTextView.text
    }
    
    ////////////////////////////////////////////////////////////////
    
    @IBAction func sortSegment(sender: UISegmentedControl) {
        if sortSegmenter.selectedSegmentIndex==0{
            // var artList = songList.sorted{$0.name < $1.name}
        } else if sortSegmenter.selectedSegmentIndex==1{
            // var artList = songList.sorted{$0.Artist < $1.Artist}
        } else if sortSegmenter.selectedSegmentIndex==2{
            // var artList = albumList.sorted{$0.Artist < $1.Artist}
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}