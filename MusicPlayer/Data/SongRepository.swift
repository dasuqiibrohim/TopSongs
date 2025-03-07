//
//  SongRepository.swift
//  MusicPlayer
//
//  Created by Mufallah FD on 07/03/25.
//

import Foundation

class SongRepository: SongRepositoryProtocol {
    private let remoteDataSource = RemoteDataSource()
    private let localDataSource = LocalDataSource()
    
    func getSongs(completion: @escaping (Result<[Song], Error>) -> Void) {
        let localSongs = localDataSource.loadSongs()
        if !localSongs.isEmpty {
            completion(.success(localSongs))
            return
        }
        
        // Fetch dari API jika local kosong
        remoteDataSource.fetchSongs { result in
            switch result {
            case .success(let songs):
                self.localDataSource.saveSongs(songs) 
                completion(.success(songs))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
