//
//  sharedPlaylistModel.swift
//  mayoPod_v2
//
//  Created by Grayson Wilkins on 2/20/15.
//  Copyright (c) 2015 Robert Mayo. All rights reserved.
//

import Foundation

private let _playlistModelSharedInstance = sharedPlaylistModel()

class sharedPlaylistModel {
    
    let thePlaylist: Playlist
    
    init(){
        thePlaylist = Playlist()
    }
    
    class var theSharedPlaylistModel: sharedPlaylistModel {
        return _playlistModelSharedInstance
    }
}
