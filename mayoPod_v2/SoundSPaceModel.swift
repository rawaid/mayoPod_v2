//
//  SoundSPaceModel.swift
//  Sound Space by Sound Space
//
//  Created by Taylor LeBlanc on 2/4/15.
//  Copyright (c) 2015 Sound Space. All rights reserved.
//

import Foundation

class Song {
    
    var name: String
    var artist: String
    var year: Int
    var length: Float
    var composer: String
    var album: String
    
    
    init(song:String, artist:String, year: Int,length:Float,composer:String,album:String){
        self.name = song
        self.artist = artist
        self.year = year
        self.length = length
        self.composer = composer
        self.album = album
    }
    
    //Stuff Joe Wrote:
    func getSongName() -> String{
        return self.name
    }
    
    func getSongArtist() -> String{
        return self.artist
    }
    
    func getSongYear() -> Int{
        return self.year
    }
    
    func getSongLength() -> Float{
        return self.length
    }
}

//Class: Album
//Last Modified: 2/17/15
//Author: Josh Chang
//Purpose: Object that simulates an album. Holds songs of a single album

class Album{
    var name: String
    var artist: String
    var year: Int
    var producer: String
    var length : Float
    
    var songs: [Song]
    
    
    //Album Constructor
    //Last Modified: 2/17/15
    //Author: Josh Chang
    //Parameters: albumName : the name of the album, artist: the artist of the album, year: the year of album, producer: the producer of the album
    init(albumName:String, artist:String, year: Int, producer:String){
        self.name = albumName
        self.artist = artist
        self.year = year
        self.producer = producer
        self.length = 0
        self.songs = []
        
    }
    
    //Method: getAlbumLength()
    //Last Modified: 2/17/15
    //Author: Josh Chang
    //Purpose: Calculate the sum of the lengths of all the songs currently in this album
    //Parameters: None
    //Output: Float
    func getAlbumLength() -> Float{
        for i in songs{
            self.length = self.length + i.length
        }
        return self.length
    }
    
    func getAlbumName() -> String{
        // returns album name
        return self.name
    }
    
    func getArtistName() -> String{
        // returns album artist
        return self.artist
    }
    
    func getAlbumYear() -> Int{
        //returns album year
        return self.year
    }
    
    func getProducer() -> String{
        //returns album producer
        return self.producer
    }
    
    func getSongsInAlbum() -> [Song]{
        //returns songs in album
        return self.songs
    }
    func addSongToPlaylist(songToAdd:Song){
        var addSong = true
        for song in self.songs{
            if song.getSongName() == songToAdd.getSongName(){
                addSong = false
            }
        }
        if addSong{
            self.songs.append(songToAdd)
        }else{
            //Some sort of error check saying song is already in playlist.
        }
    }
}

//Class: Playlist
//Last Modified: 2/17/15
//Author: Joe Delia
//Purpose: Object that simulates a playlist. Holds all songs added to the playlist
class Playlist{
    
    var plistName: String
    var plistSong: [Song]
    
    //Playlist Constructor
    //Last Modified: 2/17/15
    //Author: Joe Delia
    //Parameters: name - name of the playlist
    init(name:String){
        self.plistName = name
        self.plistSong = []
    }
    
    //Method: addSongToPlaylist(Song)
    //Last Modified: 2/17/15
    //Author: Joe Delia
    //Purpose: Takes in a song parameter, checks to see if that song is already in the playlist, and adds song to the playlist if it is not already included, or shows error message saying song is already in playlist.
    //Parameters: songToAdd - Song that will be added to playlist
    //Output: none
    func addSongToPlaylist(songToAdd:Song){
        var addSong = true
        for song in plistSong{
            if song.getSongName() == songToAdd.getSongName(){
                addSong = false
            }
        }
        if addSong{
            plistSong.append(songToAdd)
        }else{
            //Some sort of error check saying song is already in playlist.
        }
    }
    
    //Method: removeSongFromPlaylist(Song)
    //Last Modified: 2/17/15
    //Author: Joe Delia
    //Purpose: Takes in a song parameter, checks to see if the song is in the playlist, and removes that song from the playlist, or shows an error message indicating song is not in playlist.
    //Parameters: songToRemove - Song that will be removed from playlist
    //Output: none
    func removeSongFromPlaylist(songToRemove:Song){
        var count = 0
        var songRemoved = false
        for song in plistSong{
            if song.getSongName() == songToRemove.getSongName(){
                plistSong.removeAtIndex(count)
                songRemoved = true
            }
            count++
        }
        if songRemoved{
            //Song Successfully removed from playlist
        }else{
            //Song was not in playlist
        }
    }
    
    //Getter function for total length of songs in playlist
    func getPlaylistLength() -> Double{
        var plistLength = 0.0
        for song in plistSong{
            plistLength = plistLength + Double(song.getSongLength()) //Has to be casted as a double, because can't change variable type in Song Class.
        }
        return plistLength
    }
    
    //Getter function used when printing list of songs in playlist (external function)
    func getSongList() -> [Song]{
        return plistSong
    }
}









