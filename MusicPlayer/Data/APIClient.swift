//
//  APIClient.swift
//  MusicPlayer
//
//  Created by Mufallah FD on 07/03/25.
//

import Foundation

class APIClient {
    static let shared = APIClient()
    
    func fetchSongs(completion: @escaping (Result<[Song], Error>) -> Void) {
        guard let url = URL(string: "https://itunes.apple.com/us/rss/topsongs/limit=10/json") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "Data Error", code: -1, userInfo: nil)))
                return
            }
            
            do {
                let response = try JSONDecoder().decode(SongResponse.self, from: data)
                let songs = response.feed.entry.map { entry in
                    Song(
                        id: entry.id.attributes.imID,
                        trackName: entry.trackName.label,
                        artistName: entry.artistName.label,
                        albumName: entry.albumCollection.albumName.label,
                        imageUrl: entry.imageUrl.last?.label ?? "",
                        previewUrl: entry.link.last?.attributes.href ?? "",
                        fullMusicUrl: entry.link.first?.attributes.href ?? "",
                        duration: entry.link.last?.imDuration?.label ?? ""
                    )
                }
                completion(.success(songs))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

