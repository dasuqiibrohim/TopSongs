//
//  SongResponse.swift
//  MusicPlayer
//
//  Created by Mufallah FD on 07/03/25.
//

import Foundation

struct SongResponse: Codable {
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
    let link: [EntryLink]
    let id: IDLabel

    enum CodingKeys: String, CodingKey {
        case trackName = "im:name"
        case artistName = "im:artist"
        case albumCollection = "im:collection"
        case imageUrl = "im:image"
        case link, id
    }
}
struct AlbumCollection: Codable {
    let albumName: IMLabel
    
    enum CodingKeys: String, CodingKey {
        case albumName = "im:name"
    }
}
struct IDLabel: Codable {
    let attributes: IDAttributes
}
struct IDAttributes: Codable {
    let imID: String

    enum CodingKeys: String, CodingKey {
        case imID = "im:id"
    }
}
struct IMLabel: Codable {
    let label: String
}
struct EntryLink: Codable {
    let attributes: FluffyAttributes
    let imDuration: IMLabel?
    
    enum CodingKeys: String, CodingKey {
        case attributes
        case imDuration = "im:duration"
    }
}
struct FluffyAttributes: Codable {
    let href: String
}
