//
//  FetchSongsUseCase.swift
//  MusicPlayer
//
//  Created by Mufallah FD on 07/03/25.
//

import Foundation

protocol FetchSongsUseCase {
    func execute(completion: @escaping (Result<[Song], Error>) -> Void)
}
