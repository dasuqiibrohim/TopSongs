//
//  LocalDataSource.swift
//  MusicPlayer
//
//  Created by Mufallah FD on 07/03/25.
//

import Foundation

class LocalDataSource {
    private let key = "savedSongs"
    
    func saveSongs(_ songs: [Song]) {
        guard let data = try? JSONEncoder().encode(songs) else { return }
        UserDefaults.standard.set(data, forKey: key)
    }
    func loadSongs() -> [Song] {
        guard let data = UserDefaults.standard.data(forKey: key),
              let songs = try? JSONDecoder().decode([Song].self, from: data) else { return [] }
        return songs
    }
}
