//
//  sharedSongModel.swift
//  mayoPod_v2
//
//  Created by Grayson Wilkins on 2/20/15.
//  Copyright (c) 2015 Robert Mayo. All rights reserved.
//

import Foundation

private let _songModelSharedInstance = sharedSongModel()

class sharedSongModel {
    
    let thePlaylist: [Playlist]
    let theAlbumlist: [Album]
    let theSonglist: [Song]
    
    init(){
        
    }
    
    
    class var theSharedPlaylistModel: sharedMusicModel {
        return _musicModelSharedInstance
    }
}