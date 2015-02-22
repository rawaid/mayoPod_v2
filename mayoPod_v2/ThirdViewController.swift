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
    
    @IBAction func songRemoval(sender: UIButton) {
        
    }
    
    @IBAction func albumRemoval(sender: UIButton) {
        
    }
    
    @IBAction func playlistRemoval(sender: UIButton) {
        
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