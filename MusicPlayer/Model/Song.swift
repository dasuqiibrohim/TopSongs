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
    var progress: Double = 0
    let duration: Double
    var isPlaying: Bool = false
    
    var formattedProgress: String {
        return updateTimeFormatted(for: progress)
    }
    var formattedDuration: String {
        return updateTimeFormatted(for: duration)
    }
    
    private func updateTimeFormatted(for time: Double) -> String {
        let totalSeconds = Int(time) / 1000
        let minutes = totalSeconds / 60
        let seconds = totalSeconds % 60
        return String(format: "%d:%02d", minutes, seconds)
    }
}
