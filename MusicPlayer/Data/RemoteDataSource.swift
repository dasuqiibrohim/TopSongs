//
//  RemoteDataSource.swift
//  MusicPlayer
//
//  Created by Mufallah FD on 07/03/25.
//

import Foundation

class RemoteDataSource {
    func fetchSongs(completion: @escaping (Result<[Song], Error>) -> Void) {
        APIClient.shared.fetchSongs(completion: completion)
    }
}
