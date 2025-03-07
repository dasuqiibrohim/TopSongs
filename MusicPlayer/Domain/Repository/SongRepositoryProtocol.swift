//
//  SongRepositoryProtocol.swift
//  MusicPlayer
//
//  Created by Mufallah FD on 07/03/25.
//

import Foundation

protocol SongRepositoryProtocol {
    func getSongs(completion: @escaping (Result<[Song], Error>) -> Void)
}
