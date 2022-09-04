//
//  Movie.swift
//  MovieApp
//
//  Created by Rustem Manafov on 05.09.22.

import Foundation

// MARK: - Movie
struct Movie: Codable {
    let status: Int?
    let success: Bool?
    let messageStatus: String?
    let movieResponce: [MovieResult]?
}

// MARK: - Result
struct MovieResult: Codable, MovieProtocol {

    let id: String?
    let image: String?
    let title, rating, year, titleOriginal: String?
    let uuid, resultDescription: String?
    let genres, countries: [Country]?
    let release: String?
    
    var imageURL: String {
        NetworkHelper.shared.imageBaseURL
    }
    
    var titleText: String {
        title ?? ""
    }
    
    var genreText: String {
        genres?.description ?? ""
    }
    
    var releaseText: String {
        release ?? ""
    }

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case image, title, rating, year, titleOriginal, uuid
        case resultDescription = "description"
        case genres, countries, release
    }
}

// MARK: - Country
struct Country: Codable {
    let name, uuid: String?
}
