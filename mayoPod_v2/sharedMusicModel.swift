//
//  sharedMusicModel.swift
//  mayoPod_v2
//
//  Created by Grayson Wilkins on 2/20/15.
//  Copyright (c) 2015 Robert Mayo. All rights reserved.
//

import Foundation

private let _musicModelSharedInstance = sharedMusicModel()

class sharedMusicModel {
    
    let thePlaylist: Playlist
    let theAlbumlist: Album
    let theSonglist
    
    init(){
        thePlaylist = Playlist()
    }
    
    class var theSharedPlaylistModel: sharedPlaylistModel {
        return _playlistModelSharedInstance
    }
}