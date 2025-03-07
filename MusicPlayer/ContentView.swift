//
//  ContentView.swift
//  MusicPlayer
//
//  Created by Mufallah FD on 07/03/25.
//

import SwiftUI
import AVFoundation
import MediaPlayer

struct ContentView: View {
    @State private var tracks: [MusicTrack]? = nil
    @State private var player: AVPlayer? = nil
    let players = MPMusicPlayerController.applicationQueuePlayer
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                
                TextField("Search Artist .....", text: .constant(""))
                    .textFieldStyle(PlainTextFieldStyle())
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .font(.regular14)
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(100)
            .padding()
            
            Rectangle()
                .frame(height: 2)
                .foregroundColor(.manatee)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    if let tracks = tracks {
                        Text("Recommended for you")
                            .font(.medium16)
                            .foregroundColor(.rockBlue)
                        ForEach(tracks) { track in
                            MusicCardView(track)
                        }
                    } else {
                        ProgressView()
                        .tint(.white)
                    }
                }
                .padding()
            }
        
            VStack(spacing: 16) {
                // Progress Bar & Time Labels
                VStack {
                    Slider(value: .constant(0), in: 0...1)
                        .accentColor(Color.blackRock)
                        .background(
                            Capsule()
                                .fill(Color.cloudBurst)
                                .frame(height: 4)
                        )
                    HStack {
                        Text("1:46")
                            .font(.regular12)
                            .foregroundColor(.white)
                        Spacer()
                        Text("3:40")
                            .font(.regular12)
                            .foregroundColor(.white)
                    }
                }
                .padding(.horizontal)
                
                // Controls
                HStack(spacing: 0) {
                    Button {
                        
                    } label: {
                        Image(systemName: "shuffle")
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity)

                    Button {
                        
                    } label: {
                        Image(systemName: "backward.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 24))
                    }
                    .frame(maxWidth: .infinity)
                    
                    Button {
                        
                    } label: {
                        Circle()
                            .fill(Color.white)
                            .frame(width: 50, height: 50)
                            .overlay(
                                Image(systemName: /*isPlaying ? "pause.fill" :*/ "play.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 18, height: 18)
                                    .foregroundColor(.blackRock)
                            )
                    }
                    .frame(maxWidth: .infinity)
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "forward.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 24))
                    }
                    .frame(maxWidth: .infinity)
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "repeat")
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding()
            .background(Color.manatee)
            .shadow(radius: 8)
        }
        .background(Color.blackRock)
        .onAppear { fetchMusic() }
    }
    private func MusicCardView(_ track: MusicTrack) -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                Text(track.trackName)
                    .font(.medium18)
                    .foregroundColor(.white)
                HStack {
                    Text(track.artistName)
                        .font(.regular12)
                        .lineLimit(1)
                    Circle()
                        .frame(width: 4, height: 4)
                    Text(track.albumName)
                        .font(.regular12)
                        .lineLimit(1)
                }
                .foregroundColor(.rockBlue)
                Button {
                    let songID = "1773342229" // ID lagu dari Apple Music
                    let songURL = "https://music.apple.com/us/album/love-somebody/1773341928?i=\(songID)"
                    
                    if let url = URL(string: songURL) {
                        players.setQueue(with: [url.absoluteString])
                        players.play()
                    }
                } label: {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 50, height: 50)
                        .overlay(
                            Image(systemName: /*isPlaying ? "pause.fill" : "waveform" */ "play.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.blackRock)
                        )
                }
                .padding(8)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Rectangle()
                .foregroundColor(.rockBlue)
                .frame(width: 120, height: 120)
                .cornerRadius(24)
        }
        .padding()
        .background(Color.cloudBurst)
        .cornerRadius(24)
    }
    private func fetchMusic() {
        let urlString = "https://itunes.apple.com/us/rss/topsongs/limit=10/json"
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            exit(1)
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            guard let data = data else {
                print("No data received")
                return
            }
            
            // Cek apakah data JSON atau HTML
            // guard let jsonString = String(data: data, encoding: .utf8) else { return }
            do {
                let decodedData = try JSONDecoder().decode(SearchResponse.self, from: data)
                tracks = decodedData.feed.entry.map {
                    MusicTrack(
                        trackName: $0.trackName.label,
                        artistName: $0.artistName.label,
                        albumName: $0.albumCollection.albumName.label,
                        imageUrl: $0.imageUrl.first?.label ?? ""
                    )
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        task.resume()
    }
}

#Preview {
    ContentView()
}

struct MusicTrack: Identifiable {
    let id = UUID()
    let trackName: String
    let artistName: String
    let albumName: String
    let imageUrl: String
}

struct SearchResponse: Codable {
    let feed: Feed
}
struct Feed: Codable {
    let entry: [Entry]
}
struct Entry: Codable {
    let trackName: IMLabel
    let artistName: IMLabel
    let albumCollection: AlbumCollection
    let imageUrl: [IMLabel]

    enum CodingKeys: String, CodingKey {
        case trackName = "im:name"
        case artistName = "im:artist"
        case albumCollection = "im:collection"
        case imageUrl = "im:image"
    }
}
struct AlbumCollection: Codable {
    let albumName: IMLabel
    
    enum CodingKeys: String, CodingKey {
        case albumName = "im:name"
    }
}
struct IMLabel: Codable {
    let label: String
}
