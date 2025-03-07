//
//  FetchSongsUseCaseImpl.swift
//  MusicPlayer
//
//  Created by Mufallah FD on 07/03/25.
//

import Foundation

class FetchSongsUseCaseImpl: FetchSongsUseCase {
    private let repository: SongRepositoryProtocol = SongRepository()
    
    func execute(completion: @escaping (Result<[Song], Error>) -> Void) {
        repository.getSongs(completion: completion)
    }
}

