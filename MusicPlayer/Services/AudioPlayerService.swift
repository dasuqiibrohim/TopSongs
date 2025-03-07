//
//  AudioPlayerService.swift
//  MusicPlayer
//
//  Created by Mufallah FD on 07/03/25.
//

import AVFoundation

protocol AudioPlayerServiceProtocol {
    func playSong(from url: String)
    func pause()
    func stop()
}

class AudioPlayerService: AudioPlayerServiceProtocol {
    private var player: AVPlayer?

    func playSong(from url: String) {
        guard let url = URL(string: url) else { return }
        player = AVPlayer(url: url)
        player?.play()
    }

    func pause() {
        player?.pause()
    }

    func stop() {
        player?.pause()
        player = nil
    }
}
