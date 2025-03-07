//
//  SongViewModel.swift
//  MusicPlayer
//
//  Created by Mufallah FD on 07/03/25.
//

import Foundation

class SongViewModel: ObservableObject {
    @Published var songs: [Song]? = nil
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    @Published var currentIndex: Int = 0 {
        didSet {
            updateStatusSongs()
        }
    }
    var currentSong: Song? {
        songs?[currentIndex]
    }
    
    private let fetchSongsUseCase: FetchSongsUseCase = FetchSongsUseCaseImpl()
    
    func loadSongs() {
        isLoading = true
        fetchSongsUseCase.execute { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let songs):
                    self.songs = songs
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
    func playSong(for id: String) {
        guard let index = songs?.firstIndex(where: { $0.id == id }) else { return }
        currentIndex = index
    }
    func nextSong() {
        guard let songs = songs else { return }
        if currentIndex < songs.count - 1 {
            currentIndex += 1
        }
    }
    func previousSong() {
        if currentIndex > 0 {
            currentIndex -= 1
        }
    }
    
    private func updateStatusSongs() {
        guard let songs = songs,
              let currentId = currentSong?.id else { return }
        self.songs = songs.map { song in
            var updatedSong = song
            updatedSong.isPlaying = (song.id == currentId)
            return updatedSong
        }
    }
}
