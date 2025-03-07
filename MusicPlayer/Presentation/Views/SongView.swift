//
//  SongView.swift
//  MusicPlayer
//
//  Created by Mufallah FD on 07/03/25.
//

import SwiftUI
import AVFoundation
//import MediaPlayer

struct SongView: View {
    @StateObject var viewModel = SongViewModel()
    @StateObject private var playerViewModel = SongPlayerViewModel()
    
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
                    if let songs = viewModel.songs {
                        Text("Recommended for you")
                            .font(.medium16)
                            .foregroundColor(.rockBlue)
                        ForEach(songs) { song in
                            SongCardView(song)
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
                        viewModel.previousSong()
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
                        viewModel.nextSong()
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
        .onAppear { viewModel.loadSongs() }
    }
    private func SongCardView(_ song: Song) -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                Text(song.trackName)
                    .font(.medium18)
                    .foregroundColor(.white)
                HStack {
                    Text(song.artistName)
                        .font(.regular12)
                        .lineLimit(1)
                    Circle()
                        .frame(width: 4, height: 4)
                    Text(song.albumName)
                        .font(.regular12)
                        .lineLimit(1)
                }
                .foregroundColor(.rockBlue)
                Button {
                    playerViewModel.play(song: song)
                    viewModel.playSong(for: song.id)
                } label: {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 50, height: 50)
                        .overlay(
                            Image(systemName: song.isPlaying ? "waveform" : "play.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.blackRock)
                        )
                }
                .padding(8)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            // Menampilkan gambar dari URL
            AsyncImage(url: URL(string: song.imageUrl)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .foregroundColor(.rockBlue)
            .frame(width: 120, height: 120)
            .cornerRadius(24)
        }
        .padding()
        .background(Color.cloudBurst)
        .cornerRadius(24)
    }
}
