//
//  SongPlayerViewModel.swift
//  MusicPlayer
//
//  Created by Mufallah FD on 07/03/25.
//

import Foundation

class SongPlayerViewModel: ObservableObject {
    private let audioPlayer: AudioPlayerServiceProtocol
    
    init(audioPlayer: AudioPlayerServiceProtocol = AudioPlayerService()) {
        self.audioPlayer = audioPlayer
    }
    
    func play(song: Song?) {
        guard let previewUrl = song?.previewUrl else { return }
        audioPlayer.playSong(from: previewUrl)
    }
    
    func pause() {
        audioPlayer.pause()
    }
    
    func stop() {
        audioPlayer.stop()
    }
}
