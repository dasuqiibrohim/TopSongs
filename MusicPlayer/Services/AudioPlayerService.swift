//
//  AudioPlayerService.swift
//  MusicPlayer
//
//  Created by Mufallah FD on 07/03/25.
//

import AVFoundation

protocol AudioPlayerServiceProtocol {
    func playSong(from song: Song?)
    func pause()
    func stop()
}

class AudioPlayerService: AudioPlayerServiceProtocol {
    private var player: AVPlayer?
    private var timeObserver: Any?
    var onProgressUpdate: ((Double) -> Void)?
    
    func playSong(from song: Song?) {
        guard let song = song,
              let url = URL(string: song.previewUrl) else { return }
        
        stop()
        
        player = AVPlayer(url: url)
        player?.play()
        addProgressObserver()
    }
    func pause() {
        player?.pause()
    }
    func stop() {
        player?.pause()
        if let observer = timeObserver {
            player?.removeTimeObserver(observer)
            timeObserver = nil
        }
        player = nil 
        onProgressUpdate?(0)
    }
    func addProgressObserver() {
        guard let player = player else { return }
        let interval = CMTime(seconds: 1, preferredTimescale: CMTimeScale(NSEC_PER_SEC))
        
        timeObserver = player.addPeriodicTimeObserver(forInterval: interval, queue: .main) { [weak self] time in
            guard let self = self else { return }
            
            let currentTime = player.currentTime().seconds * 1000
            self.onProgressUpdate?(currentTime)
        }
    }
}
