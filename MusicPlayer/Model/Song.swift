//
//  Song.swift
//  MusicPlayer
//
//  Created by Mufallah FD on 07/03/25.
//

import Foundation

struct Song: Identifiable, Codable {
    let id: String
    let trackName: String
    let artistName: String
    let albumName: String
    let imageUrl: String
    let previewUrl: String
    let fullMusicUrl: String
    let duration: String
    var isPlaying: Bool = false
}
